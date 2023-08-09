//
//  Challenge+DimFlashingLights.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/8/23.
//

import Foundation
import SwiftUI
import UtilMacros

extension Challenge {
    static let dimFlashingLights = Challenge(feature: "Dim Flashing Lights",
                                             category: .cognitive) {
        Conclusion("Dim Flashing Lights setting allows you to avoid bright, frequent flashes of light in the media. The Dim Flashing Lights setting allows the system to calculate, mitigate, and inform you about flashing lights in a piece of media.")
        
        Hint(one: "Flickers.",
             two: "Flashing Lights.",
             three: "Videos.")
        
        Metadata(systemName: "sun.max.trianglebadge.exclamationmark",
                 color: .pink.opacity(0.8))
        
        ChallengeRequirement.iOS17
        
        GitHub(#url("https://github.com/jiachenyee/ExploreAbility-Release/tree/main/ExploreAbilityRelease/Views/Challenge/Challenges/Dim%20Flashing%20Lights"))
    }
}
