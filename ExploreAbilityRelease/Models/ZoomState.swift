//
//  ZoomState.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation

enum ZoomState: Int {
    case home
    case vision
    case mobility
    case hearing
    case cognitive
    case reset
    
    init(from challengeCategory: ChallengeCategory) {
        self = switch challengeCategory {
        case .vision: .vision
        case .mobility: .mobility
        case .hearing: .hearing
        case .cognitive: .cognitive
        }
    }
}
