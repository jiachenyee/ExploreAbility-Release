//
//  Challenge+AnimatedImages.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/8/23.
//

import Foundation
import SwiftUI
import UtilMacros

extension Challenge {
    static let animatedImages = Challenge(feature: "Animated Images",
                                          category: .cognitive) {
        Conclusion("The Animated Images setting allows you to control whether to play animated images like GIFs on the web and in apps. By default, the setting is on, which allows animated images to play automatically. Turn off the setting to indicate that you want to pause animated images on your device.")
        
        Hint(one: "There's a lot going on.",
             two: "Can we stop some of this animation?",
             three: "It's pronounced GIF not GIF.")
        
        Metadata(systemName: "photo.on.rectangle.angled",
                 color: .pink.opacity(0.9))
        
        ChallengeRequirement.iOS17
        
        GitHub(#url("https://github.com/jiachenyee/ExploreAbility-Release/tree/main/ExploreAbilityRelease/Views/Challenge/Challenges/Animated%20Images"))
    }
}
