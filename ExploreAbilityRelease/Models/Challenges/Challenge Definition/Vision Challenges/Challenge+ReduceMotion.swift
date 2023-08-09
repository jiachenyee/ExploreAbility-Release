//
//  Challenge+ReduceMotion.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/8/23.
//

import Foundation
import SwiftUI
import UtilMacros

extension Challenge {
    static let reduceMotion = Challenge(feature: "Reduce Motion",
                                        category: .vision) {
        Conclusion("When you turn on Reduce Motion, you can decrease the movement of onscreen elements. Some screen actions, such as moving between apps or launching apps, become visually simpler for motion sensitivity or to lessen strain on the eyes.")
        
        Hint(one: "There's a lot going on.",
             two: "Dizzying animations.",
             three: "There's a lot of movement, or… motion.")
        
        Metadata(systemName: "cursorarrow.motionlines",
                 color: .teal.opacity(0.8))
        
        DisableInstructions(Text("Go to **Settings \(Image(systemName: "chevron.right")) Accessibility \(Image(systemName: "chevron.right")) Motion \(Image(systemName: "chevron.right")) Reduce Motion** and toggle Reduce Motion."))
        
        ReferenceResources([
            .web("Stop or reduce motion on iPhone",
                 url: #url("https://support.apple.com/guide/iphone/iph0b691d3ed/ios")),
            .web("Stop or reduce motion on iPad",
                 url: #url("https://support.apple.com/guide/ipad/ipadc509a80c/ipados")),
            .video("How to reduce screen motion on iPhone, iPad, and iPod touch",
                   url: #url("https://youtu.be/8Ddva5UUX2U"))
        ])
        
        GitHub(#url("https://github.com/jiachenyee/ExploreAbility-Release/tree/main/ExploreAbilityRelease/Views/Challenge/Challenges/Reduce%20Motion"))
    }
}
