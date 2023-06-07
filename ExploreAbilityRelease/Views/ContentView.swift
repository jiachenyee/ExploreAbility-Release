//
//  ContentView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 3/6/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @Namespace var namespace
    
    @State private var counter = 0
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        Group {
            switch viewModel.gameState {
            case .store:
                CafeView()
            case .home:
                HomeView()
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
