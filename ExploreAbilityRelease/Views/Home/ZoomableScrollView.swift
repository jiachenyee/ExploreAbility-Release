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
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    @ViewBuilder var content: Content
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.delegate = context.coordinator
        scrollView.maximumZoomScale = 10
        scrollView.minimumZoomScale = 0.5
        scrollView.bouncesZoom = true
        
        let hostView = UIHostingController(rootView: content)
        
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(hostView.view)
        
        NSLayoutConstraint.activate([
            hostView.view.widthAnchor.constraint(equalToConstant: 2000),
            hostView.view.heightAnchor.constraint(equalToConstant: 2000),
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
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return scrollView.subviews.first
        }
        
        func scrollViewDidZoom(_ scrollView: UIScrollView) {
            
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
        }
    }
}
