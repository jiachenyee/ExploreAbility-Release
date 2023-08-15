//
//  OnboardingTab.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 14/8/23.
//

import Foundation

enum OnboardingTab: Int, Hashable {
    case welcome
    case explore
    case challenge
    case stuck
    case learn
    
    mutating func next() {
        self = OnboardingTab(rawValue: rawValue + 1)!
    }
    
    mutating func previous() {
        self = OnboardingTab(rawValue: rawValue - 1)!
    }
    
    var description: String {
        switch self {
        case .welcome:
            "Accessibility is about making your device yours."
        case .explore:
            "Your device comes with dozens of accessibility features built in to help everyone use it.\n\nFind out about these features, and maybe discover some that might help you!"
        case .challenge:
            "Try out Accessibility challenges. Each challenge requires toggling a different accessibility setting in the Settings app."
        case .stuck:
            "Select on the circle in the center of the screen to return home, or get a hint."
        case .learn:
            "Each challenge comes with Reference Resources that can help you better understand the various accessibility features and their use-cases.\n\nDeveloping an app? There are developer resources including code snippets, external links, and videos that can help you understand how to incorporate these features into your app."
        }
    }
    
    var title: String {
        switch self {
        case .welcome:
            "Make your device\nwork for you."
        case .explore:
            "Explore."
        case .challenge:
            "Have Fun!"
        case .stuck:
            "Stuck?"
        case .learn:
            "Learn."
        }
    }
}
