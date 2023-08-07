//
//  AnimatedImagesChallengeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/8/23.
//

import Foundation
import SwiftUI

@available(iOS 17.0, *)
struct AnimatedImagesChallengeView: View {
    var isFeatureToggled: Bool
    
    @Environment(\.accessibilityPlayAnimatedImages) var playAnimatedImages
    
    @State private var originalPlayAnimatedImages = false
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var didFinishChallenge = false
    
    let spacing = 8.0
    
    var body: some View {
        if !isFeatureToggled {
            ZStack {
                VStack(spacing: spacing) {
                    VStack(spacing: spacing) {
                        HStack(spacing: spacing) {
                            AnimatedImagesChallengeSample1()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            AnimatedImagesChallengeSample2()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        
                        AnimatedImagesChallengeSample3()
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .padding(.bottom, 48 - spacing * 2.5)
                    
                    HStack(spacing: spacing) {
                        VStack(spacing: spacing) {
                            AnimatedImagesChallengeSample4()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            AnimatedImagesChallengeSample5()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .padding(.trailing, 48 / 2 + 4)
                        
                        VStack(spacing: spacing) {
                            HStack(spacing: spacing) {
                                ChallengeHomeButton()
                                    .frame(width: 48)
                                AnimatedImagesChallengeSample6()
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            .frame(height: 48)
                            
                            AnimatedImagesChallengeSample7()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .padding(.leading, -48 / 2 - 4)
                    }
                    .padding(.top, -48 + spacing * 2.5)
                }
            }
            .onChange(of: playAnimatedImages) { newValue in
                guard newValue != originalPlayAnimatedImages else { return }
                
                withAnimation {
                    challengeViewModel.state = .playing(true)
                }
            }
            .onAppear {
                originalPlayAnimatedImages = playAnimatedImages
            }
        } else {
            PlayingFeatureOnView(initialState: originalPlayAnimatedImages,
                                 didSucceed: $didFinishChallenge)
                .onChange(of: playAnimatedImages) { newValue in
                    if originalPlayAnimatedImages == newValue {
                        didFinishChallenge = true
                    }
                }
        }
    }
}
