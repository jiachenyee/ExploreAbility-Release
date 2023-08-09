//
//  Challenge+ReduceTransparency.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/8/23.
//

import Foundation
import SwiftUI
import UtilMacros

extension Challenge {
    static let reduceTransparency = Challenge(feature: "Reduce Transparency",
                                              category: .vision) {
        Conclusion("Improves contrast by reducing transparency and blurs on some backgrounds.")
        
        Hint(one: "That's really distracting.",
             two: "I can't see clearly with that background.",
             three: "I hate blurs and transparencies.")
        
        Metadata(systemName: "square.on.square.intersection.dashed",
                 color: .teal.opacity(0.5))
        
        ReferenceResources([
            .web("Use display and text size preferences on your iPhone, iPad, and iPod touch",
                 url: #url("https://support.apple.com/HT207025")),
            .web("Adjust the display and text size on iPhone",
                 url: #url("https://support.apple.com/guide/iphone/iph3e2e1fb0/")),
            .web("Adjust the display and text size on iPad",
                 url: #url("https://support.apple.com/guide/ipad/ipad9a246013/"))
        ])
        
        GitHub(#url("https://github.com/jiachenyee/ExploreAbility-Release/tree/main/ExploreAbilityRelease/Views/Challenge/Challenges/Reduce%20Transparency"))
    }
}
