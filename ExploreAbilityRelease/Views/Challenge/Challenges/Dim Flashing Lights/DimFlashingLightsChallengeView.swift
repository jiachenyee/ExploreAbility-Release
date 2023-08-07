//
//  DimFlashingLightsChallengeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/8/23.
//

import Foundation
import SwiftUI

@available(iOS 17.0, *)
struct DimFlashingLightsChallengeView: View {
    
    var isFeatureToggled: Bool
    
    @Environment(\.accessibilityDimFlashingLights) var dimFlashingLights
    
    @State private var initialDimFlashingLights = false
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var showVideoPlayer = true
    
    @State private var cycleCount = 0
    
    @State private var videoPlayerProgress = 0.0
    
    @State private var didFinishChallenge = false
    
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    var body: some View {
        if !isFeatureToggled {
            ZStack {
                VStack(spacing: 0) {
                    if challengeViewModel.accomodations.contains(.useDescriptions) {
                        ZStack {
                            Rectangle()
                                .fill(.white.opacity(0.1))
                                .aspectRatio(16/9, contentMode: .fit)
                            Text("Description: This is a flashing video player.")
                        }
                    } else {
                        Rectangle()
                            .fill(.white.opacity(challengeViewModel.accomodations.contains(.dimUserInterface) ? 0.1 : 1))
                            .aspectRatio(16/9, contentMode: .fit)
                            .opacity(showVideoPlayer ? 0 : 1)
                            .onReceive(timer) { _ in
                                cycleCount += 1
                                
                                if challengeViewModel.accomodations.contains(.reduceNumberOfFlashes) {
                                    if cycleCount % 5 == 0 {
                                        showVideoPlayer.toggle()
                                    }
                                } else {
                                    showVideoPlayer.toggle()
                                }
                            }
                    }
                    
                    GeometryReader { proxy in
                        VStack(alignment: .leading) {
                            Rectangle()
                                .fill(challengeViewModel.challenge.color)
                                .frame(width: proxy.size.width * videoPlayerProgress)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(.white.opacity(0.3))
                                .frame(height: 8)
                            
                            VStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(width: proxy.size.width * 0.8)
                                    .frame(height: 21)
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(width: proxy.size.width * 0.2)
                                    .frame(height: 21)
                                RoundedRectangle(cornerRadius: 4)
                                    .frame(width: proxy.size.width * 0.3)
                                    .frame(height: 16)
                                    .opacity(0.5)
                            }
                            .padding()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .onAppear {
                        withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
                            videoPlayerProgress = 1
                        }
                    }
                    
                    Spacer()
                }
                
                ChallengeHomeButton()
            }
            .onAppear {
                initialDimFlashingLights = dimFlashingLights
            }
            .onChange(of: dimFlashingLights) { newValue in
                guard newValue != initialDimFlashingLights else { return }
                
                withAnimation {
                    challengeViewModel.state = .playing(true)
                }
            }
        } else {
            PlayingFeatureOnView(initialState: initialDimFlashingLights,
                                 didSucceed: $didFinishChallenge)
            .onChange(of: dimFlashingLights) { newValue in
                if initialDimFlashingLights == newValue {
                    didFinishChallenge = true
                }
            }
        }
    }
}
