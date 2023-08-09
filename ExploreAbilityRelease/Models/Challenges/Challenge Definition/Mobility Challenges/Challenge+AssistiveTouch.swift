//
//  Challenge+AssistiveTouch.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/8/23.
//

import Foundation
import SwiftUI
import UtilMacros

extension Challenge {
    static let assistiveTouch = Challenge(feature: "AssistiveTouch",
                                          category: .mobility) {
        Conclusion("Adapt your touchscreen to ﬁt your physical needs. If certain gestures, like pinch or tap, don’t work for you, swap them with a gesture that does or create a touch that’s all your own. You can customize the layout of the AssistiveTouch menu too, or create an alternative to pressing the Home button — a simple onscreen tap. And you can connect a Bluetooth mouse or joystick to control an onscreen pointer for navigation.\n\niPhone and iPad performs a selected action when you hold the cursor still on a screen element or an area of the screen, this is called Dwell Control and can be set up under AssistiveTouch.")
        
        Hint(one: "Gestures are a challenge.",
             two: "Buttons can be challenging too.",
             three: "Touch is hard.")
        
        Metadata(systemName: "dot.circle.and.hand.point.up.left.fill",
                 color: .cyan)
        
        ReferenceResources([
            .web("Use AssistiveTouch on your iPhone, iPad, or iPod touch",
                 url: #url("https://support.apple.com/HT202658")),
            .web("Use AssistiveTouch on iPad",
                 url: #url("https://support.apple.com/guide/ipad/ipad9a2466d3/")),
            .web("Connect a Bluetooth mouse or trackpad to your iPad",
                 url: #url("https://support.apple.com/HT211009")),
            .video("How to use AssistiveTouch on your iPhone",
                   url: #url("https://youtu.be/_j4-NTg3QsE")),
            .video("How to customize AssistiveTouch",
                   url: #url("https://youtu.be/3id4BJ4eSQg"))
        ])
        
        GitHub(#url("https://github.com/jiachenyee/ExploreAbility-Release/tree/main/ExploreAbilityRelease/Views/Challenge/Challenges/Assistive%20Touch"))
    }
}
