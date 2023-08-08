//
//  ReduceTransparencyChallengeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 8/8/23.
//

import Foundation
import SwiftUI

struct ReduceTransparencyChallengeView: View {
    
    @Environment(\.accessibilityReduceTransparency) var reduceTransparencyEnabled
    @State private var initialReduceTransparencyEnabled = false
    
    var isFeatureToggled: Bool
    
    @State private var animationState = false
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    @State private var didFinishChallenge = true
    
    var body: some View {
        if !isFeatureToggled {
            ZStack {
                VStack {
                    HStack {
                        Circle()
                            .fill(challengeViewModel.challenge.color.opacity(0.8))
                        if animationState {
                            Circle()
                                .fill(challengeViewModel.challenge.color.opacity(1))
                        }
                    }
                    if animationState {
                        Circle()
                            .fill(challengeViewModel.challenge.color.opacity(0.7))
                    }
                    Circle()
                        .fill(challengeViewModel.challenge.color.opacity(0.6))
                    
                    HStack {
                        if animationState {
                            Circle()
                                .fill(challengeViewModel.challenge.color.opacity(0.5))
                        }
                        
                        Circle()
                            .fill(challengeViewModel.challenge.color.opacity(1))
                    }
                    .onAppear(perform: {
                        withAnimation(.easeInOut(duration: 1).repeatForever()) {
                            animationState.toggle()
                        }
                    })
                }
                
                Rectangle()
                    .fill(.thinMaterial)
                    .transition(.opacity)
                    .ignoresSafeArea()
                
                Text("That's a little distracting.")
                    .padding()
                    .frame(maxHeight: .infinity, alignment: .top)
                
                ChallengeHomeButton()
            }
            .onAppear {
                initialReduceTransparencyEnabled = reduceTransparencyEnabled
            }
            .onChange(of: reduceTransparencyEnabled) { newValue in
                guard initialReduceTransparencyEnabled != newValue else { return }
                
                withAnimation {
                    challengeViewModel.state = .playing(true)
                }
            }
        } else {
            PlayingFeatureOnView(initialState: initialReduceTransparencyEnabled,
                                 didSucceed: $didFinishChallenge)
            .onChange(of: reduceTransparencyEnabled) { newValue in
                if initialReduceTransparencyEnabled == newValue {
                    didFinishChallenge = true
                }
            }
        }
        
    }
}
