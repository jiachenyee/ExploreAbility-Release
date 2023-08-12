//
//  RewardChallenge.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 10/8/23.
//

import Foundation
import SwiftUI

protocol RewardChallenge: View {
    /// Challenge title
    var title: String { get }
    
    /// Number of mugs of hot chocolate assigned to the challenge
    var reward: Int { get }
    
    /// How frequently should the challenge repeat, nil means the challenge is a one-time challenge
    var repeatSeconds: TimeInterval? { get }
    
    var assignReward: (() -> Void) { get }
}

struct DecodeBrailleRewardChallenge: RewardChallenge {
    var title: String = "Decode Braille"
    
    var assignReward: (() -> Void)
    
    var reward: Int = 3
    
    var repeatSeconds: TimeInterval? = 30
    
    var body: some View {
        EmptyView()
    }
}
