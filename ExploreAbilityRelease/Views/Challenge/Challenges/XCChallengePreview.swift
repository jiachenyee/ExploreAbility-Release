//
//  XCChallengePreview.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/6/23.
//

import Foundation
import SwiftUI

struct XCChallengePreview<Content: View>: View {
    
    var content: Content
    
    let challengeViewModel = ChallengeViewModel()
    let viewModel = ViewModel()
    
    init(challenge: Challenge,
         @ViewBuilder content: (() -> Content)) {
        self.content = content()
        
        challengeViewModel.challenge = challenge
        challengeViewModel.state = .playing
        
        viewModel.sharedNamespace = Namespace().wrappedValue
        viewModel.gameState = .challenge(challenge)
    }
    
    var body: some View {
        content
            .preferredColorScheme(.dark)
            .environmentObject(viewModel)
            .environmentObject(challengeViewModel)
    }
}
