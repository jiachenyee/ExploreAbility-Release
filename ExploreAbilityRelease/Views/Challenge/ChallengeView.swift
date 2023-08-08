//
//  ChallengeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

struct ChallengeView: View {
    
    var challenge: Challenge
    
    @EnvironmentObject var viewModel: ViewModel
    @StateObject var challengeViewModel: ChallengeViewModel = ChallengeViewModel()
    
    var body: some View {
        Group {
            switch challengeViewModel.state {
            case .unknown:
                ProgressView()
                    .matchedGeometryEffect(id: challenge.feature, in: viewModel.sharedNamespace)
                    .onAppear {
                        withAnimation {
                            challengeViewModel.challenge = challenge
                        }
                        
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
            case .warning(let warning):
                PreChallengeWarningView(warning: warning)
            case .playing(let isFeatureToggled):
                ChallengePlayingView(isFeatureToggled: isFeatureToggled)
            case .success:
                EmptyView()
            case .menu:
                ChallengeMenuView()
            case .conclusion:
                ChallengeConclusionView()
            }
        }
        .environmentObject(challengeViewModel)
    }
}
