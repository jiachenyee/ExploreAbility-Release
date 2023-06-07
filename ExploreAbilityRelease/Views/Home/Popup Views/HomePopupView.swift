//
//  HomePopupView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

struct HomePopupView<Content: View>: View {
    
    var id: String
    var systemImage: String
    
    var title: String
    var description: String?
    
    @ViewBuilder var content: Content
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var dragPosition: CGSize = .zero
    @State private var showPrompt = false
    
    @State private var showByePrompt = false
    
    var body: some View {
        GeometryReader { geometry in
            if showPrompt {
                VStack(alignment: .center) {
                    if showByePrompt {
                        Text("👋 Bye! See you next time!")
                    } else {
                        Text("Keep dragging to dismiss")
                        Image(systemName: "chevron.down")
                            .padding(.top, 4)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .offset(y: dragPosition.height / 2)
            }
            
            VStack(spacing: -40) {
                HStack {
                    ZStack {
                        Circle()
                            .fill(.black)
                            .frame(width: 90, height: 90)
                        Circle()
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.yellow)
                            .overlay {
                                Image(systemName: systemImage)
                                    .foregroundStyle(.black)
                                    .font(.system(size: 32))
                            }
                            .matchedGeometryEffect(id: "\(id)\(dragPosition == .zero ? "" : ".noanim")", in: viewModel.sharedNamespace)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    if let description {
                        Text(description)
                    }
                    
                    content
                }
                .padding(.top, 40)
                .padding()
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity,
                       alignment: .topLeading)
                .background(.white, ignoresSafeAreaEdges: .bottom)
                .zIndex(-1)
                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 16, topTrailingRadius: 16))
                
                Spacer()
            }
            .offset(y: dragPosition.height)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        guard value.translation.height > 0 else { return }
                        
                        dragPosition = value.translation
                        if dragPosition.height > 50 {
                            withAnimation {
                                showPrompt = true
                            }
                        }
                        
                        withAnimation {
                            showByePrompt = dragPosition.height / geometry.size.height > 0.3
                        }
                    }
                    .onEnded { value in
                        if value.translation.height / geometry.size.height > 0.3 {
                            withAnimation(.bouncy) {
                                viewModel.gameState = .home
                                dragPosition = .init(width: value.predictedEndTranslation.width, height: geometry.size.height)
                            }
                            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                                dragPosition = .zero
                                showByePrompt = false
                            }
                        } else {
                            withAnimation(.bouncy) {
                                dragPosition = .zero
                            }
                        }
                        
                        withAnimation {
                            showPrompt = false
                        }
                    }
            )
        }
    }
}
