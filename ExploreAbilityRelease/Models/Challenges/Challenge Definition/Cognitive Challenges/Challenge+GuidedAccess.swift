//
//  Challenge+GuidedAccess.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/8/23.
//

import Foundation
import SwiftUI
import UtilMacros

extension Challenge {
    static let guidedAccess = Challenge(feature: "Guided Access",
                                        category: .cognitive) {
        Conclusion("Guided Access helps you stay focused on the task (or app) at hand. You can limit a device to stay on one app at a time by disabling the Home button. You can even restrict access to the keyboard or touch input on certain areas of the screen so wandering taps and gestures won’t distract. Whether you’re a parent, a teacher, or just trying to help yourself focus, you have all the options you need to customize your experience on Apple products.")
        
        Hint(one: "Don't leave me.",
             two: "You're trapped here!",
             three: "Until you enter a password.")
        
        Metadata(systemName: "lock.iphone",
                 color: .pink)
        
        ReferenceResources([
            .web("Use Guided Access with iPhone, iPad, and iPod touch", url: #url("https://support.apple.com/HT202612")),
            .video("How to use Guided Access on iPad",
                   url: #url("https://youtu.be/JkDtljBD1Fw"))
        ])
        
        GitHub(#url("https://github.com/jiachenyee/ExploreAbility-Release/tree/main/ExploreAbilityRelease/Views/Challenge/Challenges/Guided%20Access"))
    }
}
