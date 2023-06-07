//
//  ChallengeCategory.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

enum ChallengeCategory {
    case vision
    case mobility
    case hearing
    case cognitive
    
    var image: Image {
        switch self {
        case .vision:
            Image(systemName: "eye")
        case .mobility:
            Image(systemName: "hand.point.up")
        case .hearing:
            Image(systemName: "ear")
        case .cognitive:
            Image(systemName: "brain.head.profile")
        }
    }
}
