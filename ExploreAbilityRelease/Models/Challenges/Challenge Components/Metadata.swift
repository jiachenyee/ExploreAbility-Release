//
//  Metadata.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 8/8/23.
//

import Foundation
import SwiftUI

struct Metadata: ChallengeComponent {
    var image: Image
    var color: Color
    
    init(image: Image, color: Color) {
        self.image = image
        self.color = color
    }
    
    init(systemName: String, color: Color) {
        self.image = Image(systemName: systemName)
        self.color = color
    }
}
