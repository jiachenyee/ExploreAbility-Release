//
//  Hint.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 8/8/23.
//

import Foundation

struct Hint: ChallengeComponent {
    var hint1: String
    var hint2: String
    var hint3: String
    
    init(one: String, two: String, three: String) {
        self.hint1 = one
        self.hint2 = two
        self.hint3 = three
    }
}
