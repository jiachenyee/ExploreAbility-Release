//
//  ViewModel.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI
import GameKit

class ViewModel: ObservableObject {
    @Published var gameState = GameState.home
    @Published var zoomFocus: ZoomState? {
        didSet {
            if zoomFocus != nil {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
        }
    }
    
    @Published var isGameCenterEnabled = false
    
    var sharedNamespace: Namespace.ID!
    
    init() {
        setUpGameCenter()
        
    }
    
    func setUpGameCenter() {
        GKLocalPlayer.local.authenticateHandler = { viewController, error in
            if error != nil {
                self.isGameCenterEnabled = true
            }
            
            GKAchievement.loadAchievements { achievements, _ in
                print(achievements)
//                self.updateAchievement(for: .vision, percentComplete: 10)
                self.updateAchievement(for: .hearing, percentComplete: 10)
                self.updateAchievement(for: .cognitive, percentComplete: 10)
                self.updateAchievement(for: .mobility, percentComplete: 10)
            }
//
//            self.updateAchievement(for: .vision, percentComplete: 100)
            
        }
    }
    
    func updateAchievement(for challengeCategory: ChallengeCategory, percentComplete: Double) {
        let id = challengeCategory.name.lowercased()
        
        let achievement = GKAchievement(identifier: id)
        print(achievement.player)
        achievement.percentComplete = percentComplete
        
        GKAchievement.report([achievement]) { error in
            print(error)
        }
    }
}
