//
//  ChallengeState.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 8/6/23.
//

import Foundation

enum ChallengeState {
    case unknown
    case warning(Warning)
    
    case requirements
    
    // Bool value refers to whether a feature is currently toggled
    case playing(Bool)
    case success
    case menu
    case conclusion
}
