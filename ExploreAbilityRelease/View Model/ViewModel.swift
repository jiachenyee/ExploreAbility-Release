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
    @Published var zoomFocus: ZoomState? {
        didSet {
            if zoomFocus != nil {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
        }
    }
    
    var sharedNamespace: Namespace.ID!
    
    init() {
        
    }
}
