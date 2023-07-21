//
//  VibrationHapticPattern.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/7/23.
//

import Foundation
import Buzz

struct VibrationHapticPattern: HapticSequence {
    var haptics: HapticEvents {
        Transient(intensity: 1, sharpness: 1)
        
        for index in 0..<9 {
            Continuous(duration: 0.1, intensity: 1 - Float(index) / 9, sharpness: 1 - Float(index) / 9)
        }
    }
}
