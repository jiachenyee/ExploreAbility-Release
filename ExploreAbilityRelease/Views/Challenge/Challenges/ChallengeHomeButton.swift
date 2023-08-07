//
//  ChallengeHomeButton.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/7/23.
//

import Foundation
import SwiftUI

struct ChallengeHomeButton: View {
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    @EnvironmentObject var viewModel: ViewModel
    
    var width = 8.0
    
    var body: some View {
        Button {
            withAnimation {
                challengeViewModel.state = .menu
            }
        } label: {
            Circle()
                .stroke(challengeViewModel.challenge.color, lineWidth: width)
                .matchedGeometryEffect(id: challengeViewModel.challenge.accessibilityFeature, in: viewModel.sharedNamespace)
                .padding(8 / 2)
                .padding(width / 2)
        }
        .frame(width: 48, height: 48)
        .accessibilityLabel("Menu")
    }
}
