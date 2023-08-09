//
//  Challenge+IncreaseContrast.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/8/23.
//

import Foundation
import SwiftUI
import UtilMacros

extension Challenge {
    static let increaseContrast = Challenge(feature: "Increase Contrast",
                                            category: .vision) {
        Conclusion("Improves colour contrast between app foreground and background colors.")
        
        Hint(one: "What does the text say?",
             two: "Some backgrounds are challenging.",
             three: "Can we fix the colours?")
        
        Metadata(systemName: "circle.righthalf.filled",
                 color: .teal.opacity(0.7))
        
        ReferenceResources([
            .web("Use display and text size preferences on your iPhone, iPad, and iPod touch",
                 url: #url("https://support.apple.com/HT207025")),
            .web("Adjust the display and text size on iPhone",
                 url: #url("https://support.apple.com/guide/iphone/iph3e2e1fb0/")),
            .web("Adjust the display and text size on iPad",
                 url: #url("https://support.apple.com/guide/ipad/ipad9a246013/"))
        ])
        
        GitHub(#url("https://github.com/jiachenyee/ExploreAbility-Release/tree/main/ExploreAbilityRelease/Views/Challenge/Challenges/Increase%20Contrast"))
    }
}
