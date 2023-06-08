//
//  ChallengeState.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 8/6/23.
//

import Foundation

enum ChallengeState {
    case unknown
    case warning(PreChallengeWarning)
    case playingOff
    case playingOn
    case success
    case menu
    case conclusion
}
