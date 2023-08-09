//
//  Challenge+VoiceOver.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/8/23.
//

import Foundation
import SwiftUI
import UtilMacros

extension Challenge {
    static let voiceOver = Challenge(feature: "VoiceOver", category: .vision) {
        Conclusion("VoiceOver is an industry‑leading screen reader that describes exactly what’s happening on your device. Auditory descriptions of onscreen elements help you easily navigate your screen through a Bluetooth keyboard or simple gestures on a touchscreen. And with unique rotor gestures that function like a dial, you can make content such as websites a breeze to browse.\n\nWith on‑device intelligence in iOS, VoiceOver can describe images in full sentences and read aloud text in an image. You can use the Camera and Photos apps with VoiceOver, even if you can’t see the screen. VoiceOver can provide image descriptions, and you can even add your own descriptions using Markup.")
        
        Metadata(systemName: "rectangle.3.group.bubble.left",
                 color: .teal)
        
        Hint(one: "Tap, Swipe, Swipe, Double-Tap.",
             two: "Listen carefully.",
             three: "A helpful voice.")
        
        ReferenceResources([
            .web("Turn on and practice VoiceOver on iPhone",
                 url: #url("https://support.apple.com/guide/iphone/iph3e2e415f/ios")),
            .web("Turn on and practice VoiceOver on iPad",
                 url: #url("https://support.apple.com/guide/ipad/ipad9a246898/ipados")),
            .web("About the VoiceOver rotor on iPhone, iPad, and iPod touch",
                 url: #url("https://support.apple.com/HT204783")),
            .web("Use VoiceOver for images and videos on iPhone",
                 url: #url("https://support.apple.com/guide/iphone/iph37e6b3844/ios")),
            .video("How to navigate with VoiceOver",
                   url: #url("https://youtu.be/qDm7GiKra28")),
            .video("How to use Screen Curtain with VoiceOver",
                   url: #url("https://youtu.be/lCHdVdocouw")),
            .video("How to drag a slider with VoiceOver",
                   url: #url("https://youtu.be/OvmkFfEbewg")),
            .video("How to organize apps with the VoiceOver rotor",
                   url: #url("https://youtu.be/w2Ds-I2L6PI")),
            .video("How to choose a new voice for VoiceOver on iPhone and iPad",
                   url: #url("https://youtu.be/T6ols9d9urQ")),
            .video("How to hear image descriptions in the Camera app on iPhone, iPad, and iPod touch",
                   url: #url("https://youtu.be/UnoeaUpHKxY"))
        ])
        
        GitHub(#url("https://github.com/jiachenyee/ExploreAbility-Release/tree/main/ExploreAbilityRelease/Views/Challenge/Challenges/VoiceOver"))
    }
}
