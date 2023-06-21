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
            Text(challengeViewModel.challenge.postChallengeMessage)
            
            Rectangle()
                .fill(.white)
                .frame(height: 1)
            
            ChallengeConclusionResourcesView(resources: challengeViewModel.challenge.resources)
            
            Rectangle()
                .fill(.white)
                .frame(height: 1)
            
            ChallengeConclusionDeveloperResourcesView(resources: challengeViewModel.challenge.developerResources,
                                                      ghURL: challengeViewModel.challenge.gitHubURL)
            
            Rectangle()
                .fill(.white)
                .frame(height: 1)
        }
    }
}
