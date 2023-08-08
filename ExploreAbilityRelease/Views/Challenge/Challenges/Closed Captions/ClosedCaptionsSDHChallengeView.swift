//
//  ClosedCaptionsSDHChallengeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/8/23.
//

import Foundation
import SwiftUI

struct ClosedCaptionsSDHChallengeView: View {
    
    var isFeatureToggled: Bool
    
    @State private var isClosedCaptioningEnabled = UIAccessibility.isClosedCaptioningEnabled
    @State private var initialIsClosedCaptioningEnabled = UIAccessibility.isClosedCaptioningEnabled
    
    private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.closedCaptioningStatusDidChangeNotification)
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    @State private var didFinishChallenge = false
    
    var body: some View {
        Group {
            if !isFeatureToggled {
                VStack(spacing: 0) {
                    Image(systemName: "questionmark.bubble")
                        .font(.system(size: 48))
                        .frame(height: 64)
                        .padding(.leading, 64)
                        .foregroundStyle(challengeViewModel.challenge.color)
                    
                    ChallengeHomeButton()
                    
                    Image("person.body")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(challengeViewModel.challenge.color.opacity(0.6))
                        .frame(height: 41)
                        .frame(height: 64, alignment: .top)
                }
                .onChange(of: isClosedCaptioningEnabled) { newValue in
                    guard newValue != initialIsClosedCaptioningEnabled else { return }
                    
                    withAnimation {
                        challengeViewModel.state = .playing(true)
                    }
                }
            } else {
                PlayingFeatureOnView(initialState: initialIsClosedCaptioningEnabled,
                                     didSucceed: $didFinishChallenge)
                .onChange(of: isClosedCaptioningEnabled) { newValue in
                    if initialIsClosedCaptioningEnabled == newValue {
                        didFinishChallenge = true
                    }
                }
            }
        }
        .onReceive(publisher) { _ in
            isClosedCaptioningEnabled = UIAccessibility.isClosedCaptioningEnabled
        }
    }
}
