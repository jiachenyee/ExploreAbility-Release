//
//  ViewModel.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var gameState = GameState.home
    
    var sharedNamespace: Namespace.ID!
    
}
