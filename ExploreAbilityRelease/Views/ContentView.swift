//
//  ContentView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 3/6/23.
//

import SwiftUI
import UIKit
import UtilMacros

struct ContentView: View {
    
    @Namespace var namespace
    
    @State private var counter = 0
    @StateObject var viewModel = ViewModel()
    @StateObject var challengePersistenceViewModel = ChallengePersistenceViewModel()
    
    var body: some View {
        Group {
            switch viewModel.gameState {
            case .home:
                HomeView()
            case .challenge(let challenge):
                ChallengeView(challenge: challenge)
            case .onboarding:
                OnboardingView()
            }
        }
        .environmentObject(viewModel)
        .environmentObject(challengePersistenceViewModel)
        .onAppear {
            viewModel.sharedNamespace = namespace
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
