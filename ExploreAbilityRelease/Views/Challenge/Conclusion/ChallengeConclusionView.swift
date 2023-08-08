//
//  ChallengeConclusionView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 13/6/23.
//

import Foundation
import SwiftUI

struct ChallengeConclusionView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    var body: some View {
        ChallengeConclusionContainerView(namespace: viewModel.sharedNamespace,
                                         challenge: challengeViewModel.challenge) {
            Text(challengeViewModel.challenge.postChallengeMessage ?? "")
            
            Separator()
            
            ResourcesView(resources: challengeViewModel.challenge.resources)
            
            Separator()
            
            DeveloperResourcesView(resources: challengeViewModel.challenge.developerResources,
                                   ghURL: challengeViewModel.challenge.gitHubURL)
            
            Separator()
        } onDismiss: {
            withAnimation {
                viewModel.gameState = .home
            }
        }
    }
}
