//
//  ChallengePersistentData.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/8/23.
//

import Foundation

struct ChallengePersistentData: Codable {
    var challenge: Challenge {
        get {
            Challenge.all.first {
                $0.feature == feature
            }!
        }
        set {
            feature = newValue.feature
        }
    }
    
    var unlockedHints: Int
    
    var isSolved: Bool {
        solveDate != nil
    }
    
    var solveDate: Date?
    
    var feature: String
    
    init(_ challenge: Challenge, unlockedHints: Int, solveDate: Date? = nil) {
        self.unlockedHints = unlockedHints
        self.solveDate = solveDate
        self.feature = challenge.feature
    }
}
