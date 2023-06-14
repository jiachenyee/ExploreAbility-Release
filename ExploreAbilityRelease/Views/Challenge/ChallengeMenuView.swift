//
//  ChallengeMenuView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 12/6/23.
//

import Foundation
import SwiftUI

struct ChallengeMenuView: View {
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var isFannedOut = false
    @State private var isLabelShown = false
    
    var body: some View {
        ZStack {
            if !isFannedOut {
                ZStack {
                    Circle()
                        .fill(challengeViewModel.challenge.color)
                        .frame(width: 48, height: 48)
                        .matchedGeometryEffect(id: "home.button", in: viewModel.sharedNamespace)
                    Circle()
                        .fill(challengeViewModel.challenge.color)
                        .frame(width: 48, height: 48)
                        .matchedGeometryEffect(id: "help.button", in: viewModel.sharedNamespace)
                    Circle()
                        .fill(challengeViewModel.challenge.color)
                        .frame(width: 48, height: 48)
                        .matchedGeometryEffect(id: "close.button", in: viewModel.sharedNamespace)
                }
                .matchedGeometryEffect(id: challengeViewModel.challenge.accessibilityFeature, in: viewModel.sharedNamespace)
            } else {
                VStack(spacing: 8) {
                    HStack(spacing: 16) {
                        Button {
                            withAnimation {
                                isFannedOut = false
                            }
                            
                            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
                                withAnimation {
                                    viewModel.gameState = .home
                                }
                            }
                            
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        } label: {
                            Circle()
                                .fill(challengeViewModel.challenge.category!.color)
                                .frame(width: 48, height: 48)
                                .overlay {
                                    VStack(spacing: -8) {
                                        HStack(spacing: -4) {
                                            Image(systemName: "hexagon")
                                                .foregroundStyle(.black)
                                            Image(systemName: "hexagon")
                                                .foregroundStyle(.black)
                                        }
                                        .opacity(0.3)
                                        
                                        Image(systemName: "hexagon.fill")
                                            .foregroundStyle(.black)
                                        
                                        HStack(spacing: -4) {
                                            Image(systemName: "hexagon")
                                                .foregroundStyle(.black)
                                            Image(systemName: "hexagon")
                                                .foregroundStyle(.black)
                                        }
                                        .opacity(0.3)
                                    }
                                    .font(.system(size: 24))
                                }
                                .overlay {
                                    if isLabelShown {
                                        ArcText(angle: .pi - 0.8, text: "HOME", fontSize: 12)
                                            .padding(-21)
                                            .transition(
                                                .modifier(active: _RotationEffect(angle: .degrees(40)),
                                                          identity: _RotationEffect(angle: .degrees(0))).combined(with: .opacity))
                                }
                            }
                        }
                        .matchedGeometryEffect(id: "home.button", in: viewModel.sharedNamespace)
                        
                        Button {
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        } label: {
                            Circle()
                                .fill(challengeViewModel.challenge.category!.color)
                                .frame(width: 48, height: 48)
                                .overlay {
                                    Image(systemName: "questionmark")
                                        .foregroundStyle(.black)
                                }
                                .overlay {
                                    if isLabelShown {
                                        ArcText(angle: 0.8, text: "HINT", fontSize: 12)
                                            .padding(-21)
                                            .transition(
                                                .modifier(active: _RotationEffect(angle: .degrees(-40)),
                                                          identity: _RotationEffect(angle: .degrees(0))).combined(with: .opacity))
                                    }
                                }
                        }
                        .matchedGeometryEffect(id: "help.button", in: viewModel.sharedNamespace)
                    }
                    .onAppear {
                        withAnimation(.spring(dampingFraction: 0.5).delay(0.3)) {
                            isLabelShown = true
                        }
                        
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { _ in
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        }
                    }
                    Button {
                        withAnimation {
                            isFannedOut = false
                            challengeViewModel.state = .playingOff
                        }
                        
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    } label: {
                        Circle()
                            .fill(challengeViewModel.challenge.category!.color.opacity(0.2))
                            .frame(width: 48, height: 48)
                            .overlay {
                                Image(systemName: "xmark")
                                    .foregroundStyle(challengeViewModel.challenge.category!.color)
                            }
                    }
                    .matchedGeometryEffect(id: "close.button", in: viewModel.sharedNamespace)
                }
            }
        }
        .onAppear {
            withAnimation(.spring(dampingFraction: 0.5)) {
                isFannedOut = true
            }
        }
    }
}
