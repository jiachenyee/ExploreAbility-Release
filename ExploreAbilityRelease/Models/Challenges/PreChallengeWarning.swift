//
//  PreChallengeWarning.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

struct PreChallengeWarning {
    var title: String
    var icon: Image
    var description: String
    var modifications: [String]
    
    static let flashingLight = PreChallengeWarning(title: "Flashing Lights",
                                                   icon: Image(systemName: "light.max"),
                                                   description: "The next challenge involves flashing lights. If you are sensitive to flashing lights, consider playing the challenge with the following accomodations.",
                                                   modifications: [
                                                    "Dim user interface",
                                                    "Reduce number of flashes"
                                                   ])
}
