//
//  Challenge.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

struct Challenge {
    var accessibilityFeature: String
    
    var hint: String
    var postChallengeMessage: String
    
    var image: Image
    var color: Color
    
    var category: ChallengeCategory?
    var warning: PreChallengeWarning?
    
    var requirements: ChallengeRequirement?
}
