//
//  Challenge+DifferentiateWithoutColour.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/8/23.
//

import Foundation
import SwiftUI
import UtilMacros

extension Challenge {
    static let differentiateWithoutColour = Challenge(feature: "Differentiate Without Colour",
                                                      category: .vision) {
        Conclusion("This setting replaces user interface items that rely on color to convey information with alternatives. For example: Status icons with a green circle and a red circle would appear as a green circle 🟢  and red square 🟥 with Differentiate Without Colour enabled.")
        
        Hint(one: "Every colour looks the same.",
             two: "Not everyone can see colour.",
             three: "Shapes.")
        
        Metadata(systemName: "swatchpalette",
                 color: .teal.opacity(0.6))
        
        DisableInstructions(Text("Go to **Settings \(Image(systemName: "chevron.right")) Accessibility \(Image(systemName: "chevron.right")) Display & Text Size \(Image(systemName: "chevron.right")) Differentiate Without Colour** and toggle Differentiate Without Colour."))
        
        ReferenceResources([
            .web("Use display and text size preferences on your iPhone, iPad, and iPod touch",
                 url: #url("https://support.apple.com/HT207025"))
        ])
        
        GitHub(#url("https://github.com/jiachenyee/ExploreAbility-Release/tree/main/ExploreAbilityRelease/Views/Challenge/Challenges/Differentiate%20Without%20Color"))
    }
}
