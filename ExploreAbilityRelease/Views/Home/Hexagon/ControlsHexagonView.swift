//
//  ControlsHexagonView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

struct ControlsHexagonView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var isGameCenterPresented = false
    
    var body: some View {
        ZStack {
            HStack(spacing: 16) {
                VStack(spacing: 21) {
                    HomeViewActionButton("gamecenter", color: .yellow.opacity(0.5)) {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        
                        isGameCenterPresented.toggle()
                    }
                    .fullScreenCover(isPresented: $isGameCenterPresented) {
                        GameCenterView()
                            .ignoresSafeArea()
                    }
                    
                    HomeViewActionButton(systemName: "switch.2", color: .yellow.opacity(0.7)) {
                        withAnimation(.bouncy) {
                            viewModel.gameState = .settings
                        }
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
                    .matchedGeometryEffect(id: "settings", in: viewModel.sharedNamespace)
                }
                
                VStack(spacing: 21) {
                    HomeViewActionButton(systemName: "mug.fill", color: .yellow) {
                        withAnimation(.bouncy) {
                            viewModel.gameState = .store
                        }
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
                    .matchedGeometryEffect(id: "cafe.icon", in: viewModel.sharedNamespace)
                    
                    if viewModel.zoomFocus == .home {
                        Button {
                            withAnimation(.bouncy) {
                                viewModel.zoomFocus = .reset
                            }
                        } label: {
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundStyle(.white.opacity(0.1))
                                .overlay {
                                    Image(systemName: "xmark")
                                        .font(.system(size: 25))
                                        .foregroundStyle(.white.opacity(0.5))
                                }
                        }
                        .accessibilityLabel("Unfocus Home")
                    } else {
                        Button {
                            withAnimation(.bouncy) {
                                viewModel.zoomFocus = .home
                            }
                        } label: {
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundStyle(.white.opacity(0.1))
                                .overlay {
                                    Image(systemName: "house")
                                        .font(.system(size: 25))
                                        .foregroundStyle(.yellow)
                                }
                        }
                        .accessibilityLabel("Zoom to Home")
                    }
                    
                    HomeViewActionButton(systemName: "hand.raised.app.fill", color: .yellow.opacity(0.6)) {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
                }
                VStack(spacing: 21) {
                    HomeViewActionButton(systemName: "heart.fill", color: .yellow.opacity(0.9)) {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
                    
                    HomeViewActionButton(systemName: "square.and.arrow.up", color: .yellow.opacity(0.8)) {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
                }
            }
            .imageScale(.large)
            
            .padding(32)
            .overlay {
                LinearGradient(colors: [.yellow, .yellow.opacity(0.5)],
                               startPoint: .topLeading, endPoint: .bottomTrailing)
                .mask {
                    Image("hex")
                        .resizable()
                        .scaledToFit()
                }
                .allowsHitTesting(false)
            }
            .padding(-32)
        }
    }
}
