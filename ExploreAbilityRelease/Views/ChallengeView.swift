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
                    .matchedGeometryEffect(id: challenge.accessibilityFeature, in: viewModel.sharedNamespace)
                    .onAppear {
                        withAnimation {
                            challengeViewModel.challenge = challenge
                        }
                    }
            case .warning(let warning):
                PreChallengeWarningView(warning: warning)
            case .playingOff, .playingOn:
                ChallengePlayingView()
            case .success:
                EmptyView()
            case .menu:
                EmptyView()
            case .conclusion:
                EmptyView()
            }
        }
        .environmentObject(challengeViewModel)
    }
}
