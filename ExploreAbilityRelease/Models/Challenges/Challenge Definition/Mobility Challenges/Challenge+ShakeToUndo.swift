//
//  Challenge+ShakeToUndo.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/8/23.
//

import Foundation
import SwiftUI
import UtilMacros

extension Challenge {
    static let shakeToUndo = Challenge(feature: "Shake to Undo",
                                       category: .mobility) {
        Conclusion("If you have difficulties with hand tremors, dexterity, or fine motor control, you can turn off Shake to Undo if you unintentionally shake it.")
        
        Hint(one: "Shake.",
             two: "Undo Typing",
             three: "Unintentional shakes.")
        
        Metadata(systemName: "iphone.gen3.radiowaves.left.and.right",
                 color: .cyan.opacity(0.9))
        
        GitHub(#url("https://github.com/jiachenyee/ExploreAbility-Release/tree/main/ExploreAbilityRelease/Views/Challenge/Challenges/Shake%20to%20Undo"))
    }
}
