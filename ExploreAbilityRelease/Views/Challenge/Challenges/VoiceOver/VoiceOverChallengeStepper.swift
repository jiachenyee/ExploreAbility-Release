//
//  VoiceOverChallengeStepper.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/8/23.
//

import Foundation
import SwiftUI

struct VoiceOverChallengeStepper: View {
    
    @Binding var solvedChallengeControls: Set<VoiceOverChallengeControls>
    
    @State private var stepperValue = 1
    
    var body: some View {
        Stepper(value: $stepperValue) {
            Text("Set this stepper's value to 10")
        }
    }
}
