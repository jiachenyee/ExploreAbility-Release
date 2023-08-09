//
//  Challenge+MonoAudio.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/8/23.
//

import Foundation
import SwiftUI
import UtilMacros

extension Challenge {
    static let monoAudio = Challenge(feature: "Mono Audio",
                                     category: .hearing) {
        Conclusion("Stereo recordings usually have distinct left- and right-channel audio tracks. Mono Audio can help streamline the differences by playing both audio channels in both ears. You can adjust the balance for greater volume in either ear, so you won’t miss a single note of a concert or word of an audiobook.\n\nYou can also turn on noise cancellation even when you’re using only one of your AirPods.")
        
        Hint(one: "Left, Right.",
             two: "One.",
             three: "Never miss a beat.")
        
        Metadata(systemName: "earbuds",
                 color: .indigo.opacity(0.9))
        
        ReferenceResources([
            .web("Adjust the mono audio, balance, and phone noise cancellation settings on iPhone",
                 url: #url("https://support.apple.com/guide/iphone/iph3e2e2cdc/")),
            .web("Adjust the mono audio and balance settings on iPad",
                 url: #url("https://support.apple.com/guide/ipad/ipad9a246ed2/")),
            .web("Play the same sound in both of your AirPods",
                 url: #url("https://support.apple.com/guide/airpods/dev2b840e13e/web"))
        ])
        
        GitHub(#url("https://github.com/jiachenyee/ExploreAbility-Release/tree/main/ExploreAbilityRelease/Views/Challenge/Challenges/Mono%20Audio"))
    }
}
