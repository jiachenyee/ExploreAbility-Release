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
        VStack(spacing: -32) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(challengeViewModel.challenge.color.opacity(0.5), style: .init(lineWidth: 8))
                    .matchedGeometryEffect(id: challengeViewModel.challenge.accessibilityFeature + ".frame", in: viewModel.sharedNamespace)
                
                VStack(alignment: .leading) {
                    Text(challengeViewModel.challenge.accessibilityFeature)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.top, .horizontal], 20)
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text(challengeViewModel.challenge.postChallengeMessage)
                            
                            Rectangle()
                                .fill(.white)
                                .frame(height: 1)
                            
                            ChallengeConclusionResourcesView(resources: challengeViewModel.challenge.resources)
                            
                            Rectangle()
                                .fill(.white)
                                .frame(height: 1)
                            
                            ChallengeConclusionDeveloperResourcesView(resources: challengeViewModel.challenge.developerResources, ghURL: challengeViewModel.challenge.gitHubURL)
                            
                            Rectangle()
                                .fill(.white)
                                .frame(height: 1)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.horizontal, .bottom], 20)
                        .padding(.bottom, 32)
                    }
                }
                .padding(4)
                .multilineTextAlignment(.leading)
            }
            
            ZStack {
                Circle()
                    .fill(.black)
                    .frame(width: 64, height: 64)
                
                Circle()
                    .fill(challengeViewModel.challenge.color)
                    .frame(width: 48, height: 48)
                
                challengeViewModel.challenge.image
            }
            .matchedGeometryEffect(id: challengeViewModel.challenge.accessibilityFeature, in: viewModel.sharedNamespace)
        }
        .padding()
    }
}
