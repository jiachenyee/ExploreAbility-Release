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
            Button {
                withAnimation(.bouncy) {
                    viewModel.gameState = .home
                }
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 24))
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.bottom, 48)
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(challengeViewModel.challenge.color.opacity(0.5), style: .init(lineWidth: 8))
                    .matchedGeometryEffect(id: challengeViewModel.challenge.accessibilityFeature + ".frame", in: viewModel.sharedNamespace)
                
                VStack(alignment: .leading) {
                    Text(challengeViewModel.challenge.accessibilityFeature)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    ScrollView {
                        Text(challengeViewModel.challenge.postChallengeMessage)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .multilineTextAlignment(.leading)
                .padding(24)
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
