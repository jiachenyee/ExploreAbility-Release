//
//  ChallengeMenuView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 12/6/23.
//

import Foundation
import SwiftUI

struct ChallengeMenuView: View {
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var isFannedOut = false
    
    var body: some View {
        ZStack {
            if !isFannedOut {
                MenuClosed(namespace: viewModel.sharedNamespace,
                           challenge: challengeViewModel.challenge)
            } else {
                MenuButtons(isFannedOut: $isFannedOut,
                            color: challengeViewModel.challenge.category!.color)
            }
        }
        .onAppear {
            withAnimation(.spring(dampingFraction: 0.5)) {
                isFannedOut = true
            }
        }
    }
}
