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
    
    var challenges: [Challenge]
    var challengeIndex: Int
    
    var body: some View {
        if challengeIndex < challenges.count {
            let challenge = challenges[challengeIndex]
            
            HomeViewActionButton(image: challenge.image,
                                 color: challenge.color) {
                withAnimation {
                    viewModel.gameState = .challenge(challenge)
                }
            }
            .matchedGeometryEffect(id: challenge.accessibilityFeature, in: viewModel.sharedNamespace)
        } else {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundStyle(.white.opacity(0.05))
        }
    }
}
