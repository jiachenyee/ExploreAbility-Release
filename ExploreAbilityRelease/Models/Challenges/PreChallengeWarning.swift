//
//  PreChallengeWarning.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

struct PreChallengeWarning: ChallengeComponent {
    var title: String
    var icon: Image
    var description: String
    var modifications: [ChallengeAccomodation]
    
    static let flashingLight = PreChallengeWarning(title: "Flashing Lights",
                                                   icon: Image(systemName: "light.max"),
                                                   description: "The next challenge may involve bright, flashing lights. If you are sensitive to flashing lights, consider playing the challenge with the following accomodations enabled.",
                                                   modifications: [
                                                    .dimUserInterface,
                                                    .reduceNumberOfFlashes,
                                                    .useDescriptions
                                                   ])
}

enum ChallengeAccomodation: String {
    case dimUserInterface = "Dim user interface"
    case reduceNumberOfFlashes = "Reduce number of flashes"
    case useDescriptions = "Use text descriptions instead"
}
