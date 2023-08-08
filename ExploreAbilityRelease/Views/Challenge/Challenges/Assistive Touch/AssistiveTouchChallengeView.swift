//
//  AssistiveTouchChallengeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 8/8/23.
//

import Foundation
import SwiftUI

struct AssistiveTouchChallengeView: View {
    
    var isFeatureToggled: Bool
    
    private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.assistiveTouchStatusDidChangeNotification)
    
    @State private var isAssistiveTouchEnabled = UIAccessibility.isAssistiveTouchRunning
    @State private var initialIsAssistiveTouchEnabled = false
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    @State private var didFinishChallenge = false
    
    var body: some View {
        Group {
            if !isFeatureToggled {
                ZStack {
                    ForEach(0..<3) { index in
                        let width = 48 + 8 * Double(index)
                        
                        Circle()
                            .fill(challengeViewModel.challenge.color)
                            .frame(width: width, height: width)
                            .opacity(0.3)
                    }
                    
                    ChallengeHomeButton()
                }
                .onChange(of: isAssistiveTouchEnabled) { newValue in
                    guard newValue != initialIsAssistiveTouchEnabled else { return }
                    
                    withAnimation {
                        challengeViewModel.state = .playing(true)
                    }
                }
            } else {
                PlayingFeatureOnView(initialState: initialIsAssistiveTouchEnabled,
                                     didSucceed: $didFinishChallenge)
                .onChange(of: isAssistiveTouchEnabled) { newValue in
                    if initialIsAssistiveTouchEnabled == newValue {
                        didFinishChallenge = true
                    }
                }
            }
        }
        .onReceive(publisher) { _ in
            isAssistiveTouchEnabled = UIAccessibility.isAssistiveTouchRunning
        }
    }
}
