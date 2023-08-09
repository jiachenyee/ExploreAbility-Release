//
//  Challenge+Captions.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/8/23.
//

import Foundation
import SwiftUI
import UtilMacros

extension Challenge {
    static let captions = Challenge(feature: "Closed Captions + SDH",
                                    category: .hearing) {
        Conclusion("Closed captions are a text transcription of a video’s dialogue, as well as nonverbal communication. Supported in apps like the Apple TV app, closed captions are available in over 40 languages for movies, TV shows, videos, and podcasts — just look for the CC icon. You can even customize captions with different styles and fonts, including styles that are larger and outlined for better legibility.")
        
        Hint(one: "Silent voices.",
             two: "Voices but I can't hear them.",
             three: "Could I read them?")
        
        Metadata(systemName: "captions.bubble",
                 color: .indigo)
        
        ReferenceResources([
            .web("Display subtitles and captions for videos and HomePod announcements on iPhone",
                 url: #url("https://support.apple.com/guide/iphone/iph3e2e23d1/")),
            .web("Display subtitles and captions for videos and HomePod announcements on iPad",
                 url: #url("https://support.apple.com/guide/ipad/ipad9a246b38/")),
            .web("Change the closed captions or language for movies and TV shows in the Apple TV app",
                 url: #url("https://support.apple.com/HT202641"))
        ])
        
        GitHub(#url("https://github.com/jiachenyee/ExploreAbility-Release/tree/main/ExploreAbilityRelease/Views/Challenge/Challenges/Closed%20Captions"))
    }
}
