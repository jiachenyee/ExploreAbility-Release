//
//  ZoomableScrollView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI
import UIKit

struct ZoomableScrollView<Content: View>: UIViewRepresentable {
    
    @ViewBuilder var content: Content
    
    @EnvironmentObject var viewModel: ViewModel
    
    let width: CGFloat = 1500
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.delegate = context.coordinator
        scrollView.maximumZoomScale = 6
        scrollView.minimumZoomScale = 1
        scrollView.bouncesZoom = true
        
        let hostView = UIHostingController(rootView: content)
        
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(hostView.view)
        
        NSLayoutConstraint.activate([
            hostView.view.widthAnchor.constraint(equalToConstant: width),
            hostView.view.heightAnchor.constraint(equalToConstant: width),
            hostView.view.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            hostView.view.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            
        ])
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
            let centerX = (scrollView.contentSize.width - scrollView.frame.size.width) / 2
            let centerY = (scrollView.contentSize.height - scrollView.frame.size.height) / 2
            scrollView.setContentOffset(CGPoint(x: centerX, y: centerY), animated: false)
        }
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        guard let zoomFocus = viewModel.zoomFocus else { return }
        
        let zoomWidth = uiView.bounds.size.width / 10 * 7
        
        let centerX: CGFloat
        let centerY: CGFloat
        
        switch zoomFocus {
        case .home:
            centerX = width / 2 - zoomWidth / 2
            centerY = width / 2 - zoomWidth / 2
        case .vision:
            centerX = width / 2 - zoomWidth / 2 - 120
            centerY = width / 2 - zoomWidth / 2 - 210
        case .mobility:
            centerX = width / 2 - zoomWidth / 2 - 120
            centerY = width / 2 - zoomWidth / 2 + 210
        case .hearing:
            centerX = width / 2 - zoomWidth / 2 + 120
            centerY = width / 2 - zoomWidth / 2 - 210
        case .cognitive:
            centerX = width / 2 - zoomWidth / 2 + 120
            centerY = width / 2 - zoomWidth / 2 + 210
        case .reset:
            let centerX = width / 2 - uiView.bounds.size.width / 2
            let centerY = width / 2 - uiView.bounds.size.width / 2
            
            uiView.zoom(to: CGRect(x: centerX, y: centerY,
                                   width: uiView.bounds.size.width,
                                   height: uiView.bounds.size.width),
                        animated: true)
            
            return
        }
        
        uiView.zoom(to: CGRect(x: centerX, y: centerY, width: zoomWidth, height: zoomWidth),
                    animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        
        var parent: ZoomableScrollView
        
        init(_ parent: ZoomableScrollView) {
            self.parent = parent
        }
        
        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return scrollView.subviews.first
        }
        
        func scrollViewDidZoom(_ scrollView: UIScrollView) {
            
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
        }
        
        func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            withAnimation(.bouncy) {
                parent.viewModel.zoomFocus = nil
            }
        }
    }
}
