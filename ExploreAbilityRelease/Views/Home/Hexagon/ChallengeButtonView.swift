//
//  ChallengeButtonView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

struct ChallengeButtonView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var challengePersistenceViewModel: ChallengePersistenceViewModel
    
    var challenges: [Challenge]
    var challengeIndex: Int
    
    var body: some View {
        if challengeIndex < challenges.count {
            let challenge = challenges[challengeIndex]
            
            HomeViewActionButton(image: challenge.image,
                                 color: challenge.color,
                                 completed: challengePersistenceViewModel.retrieveChallenge(challenge).isSolved) {
                withAnimation {
                    viewModel.gameState = .challenge(challenge)
                }
            }
            .matchedGeometryEffect(id: challenge.feature, in: viewModel.sharedNamespace)
            .accessibilityIdentifier(challenge.feature)
            .overlay {
                if !challenge.meetsRequirements() {
                    Image(systemName: "exclamationmark.circle.fill")
                        .font(.system(size: 21))
                        .symbolRenderingMode(.multicolor)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .shadow(radius: 8)
                }
            }
        } else {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundStyle(.white.opacity(0.05))
        }
    }
}
