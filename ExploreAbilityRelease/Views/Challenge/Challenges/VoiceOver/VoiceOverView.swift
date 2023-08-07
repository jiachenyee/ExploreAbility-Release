//
//  VoiceOverView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/8/23.
//

import Foundation
import SwiftUI

struct VoiceOverView: View {
    
    var isFeatureToggled: Bool
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var didFinishChallenge = false
    
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    
    @State private var initialVoiceOverEnabled = false
    @State private var solvedChallengeControls: Set<VoiceOverChallengeControls> = []
    
    @State private var blurIntensity = 32.0
    
    var body: some View {
        if !isFeatureToggled {
            ZStack {
                VStack {
                    Text("There are buttons, toggles, sliders, and more on screen. However, I can't see them well.")
                        .multilineTextAlignment(.center)
                        .padding()
                        .accessibilitySortPriority(2)
                    
                    Form {
                        Section("Easy") {
                            Button("Tap on this button!") {
                                solvedChallengeControls.insert(.button)
                            }
                            
                            VoiceOverChallengeToggle(solvedChallengeControls: $solvedChallengeControls)
                        }
                        
                        Section("Medium") {
                            VoiceOverChallengeStepper(solvedChallengeControls: $solvedChallengeControls)
                            VoiceOverChallengePicker(solvedChallengeControls: $solvedChallengeControls)
                        }
                        
                        Section("Hard") {
                            VoiceOverChallengeSlider(solvedChallengeControls: $solvedChallengeControls)
                            VoiceOverChallengeDatePicker(solvedChallengeControls: $solvedChallengeControls)
                        }
                        
                        Button("Done") {
                            if solvedChallengeControls == Set(VoiceOverChallengeControls.allCases) {
                                withAnimation {
                                    blurIntensity = 0
                                }
                                
                                Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                                    withAnimation {
                                        challengeViewModel.state = .playing(true)
                                    }
                                }
                            }
                        }
                    }
                    .allowsHitTesting(voiceOverEnabled)
                    .accessibilitySortPriority(1)
                    .blur(radius: blurIntensity)
                }
                
                ChallengeHomeButton()
                    .accessibilitySortPriority(0)
            }
            .onAppear {
                initialVoiceOverEnabled = voiceOverEnabled
            }
        } else {
            PlayingFeatureOnView(initialState: initialVoiceOverEnabled, didSucceed: $didFinishChallenge)
                .onChange(of: initialVoiceOverEnabled) { newValue in
                    if initialVoiceOverEnabled == newValue {
                        didFinishChallenge = true
                    }
                }
        }
    }
}
