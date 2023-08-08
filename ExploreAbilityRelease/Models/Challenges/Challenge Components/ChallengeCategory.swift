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
    
    var name: String {
        switch self {
        case .vision: "Vision"
        case .mobility: "Mobility"
        case .hearing: "Hearing"
        case .cognitive: "Cognitive"
        }
    }
    
    var color: Color {
        switch self {
        case .vision: .mint
        case .mobility: .cyan
        case .hearing: .indigo
        case .cognitive: .pink
        }
    }
    
    var challenges: [Challenge] {
        switch self {
        case .vision: Challenge.vision
        case .mobility: Challenge.mobility
        case .hearing: Challenge.hearing
        case .cognitive: Challenge.cognitive
        }
    }
    
    var labelPosition: CGPoint {
        switch self {
        case .vision: CGPoint(x: -65, y: -110)
        case .mobility: CGPoint(x: -65, y: 110)
        case .hearing: CGPoint(x: 65, y: -110)
        case .cognitive: CGPoint(x: 65, y: 110)
        }
    }
    
    var labelAngle: Angle {
        switch self {
        case .vision: .degrees(-30)
        case .mobility: .degrees(30)
        case .hearing: .degrees(30)
        case .cognitive: .degrees(-30)
        }
    }
}
