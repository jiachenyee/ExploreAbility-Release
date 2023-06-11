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
    
    var body: some View {
        Group {
            switch viewModel.gameState {
            case .store:
                CafeView()
            case .settings:
                SettingsView()
            case .home:
                HomeView()
            case .challenge(let challenge):
                ChallengeView(challenge: challenge)
            }
        }
        .environmentObject(viewModel)
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
