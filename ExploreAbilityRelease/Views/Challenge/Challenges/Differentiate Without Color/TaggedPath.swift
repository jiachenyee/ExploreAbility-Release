//
//  TaggedPath.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/7/23.
//

import Foundation
import SwiftUI

struct TaggedPath: Identifiable {
    var id = UUID()
    
    var points: [CGPoint]
    var color: Color
    
    func imageName() -> String {
        switch color {
        case .red: "tile.triangles"
        case .yellow: "tile.circles"
        case .teal: "tile.hexagons"
        case .mint: "tile.squares"
        case .orange: "tile.diamonds"
        case .green: "tile.seals"
        default: ""
        }
    }
    
    func colorIntensity() -> Double {
        switch color {
        case .red: 1
        case .yellow: 0.8
        case .teal: 0.6
        case .mint: 0.5
        case .orange: 0.4
        case .green: 0.3
        default: 0
        }
    }
}
