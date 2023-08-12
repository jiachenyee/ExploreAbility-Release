//
//  ChallengeViewModel.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 8/6/23.
//

import Foundation
import SwiftUI

class ChallengeViewModel: ObservableObject {
    var challenge: Challenge! {
        didSet {
            if ChallengePersistenceViewModel().retrieveChallenge(challenge).isSolved {
                state = .conclusion
            } else if !(challenge.requirements?.evaluateRequirement() ?? false) {
                state = .requirements
            } else if let warning = challenge.warning {
                state = .warning(warning)
            } else {
                state = .playing(false)
            }
        }
    }
    
    var accomodations: Set<ChallengeAccomodation> = []
    
    @Published var state: ChallengeState = .unknown
}
