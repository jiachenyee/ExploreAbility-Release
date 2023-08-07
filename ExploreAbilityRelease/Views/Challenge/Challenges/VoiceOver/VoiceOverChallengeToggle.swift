//
//  VoiceOverChallengeToggle.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/8/23.
//

import Foundation
import SwiftUI

struct VoiceOverChallengeToggle: View {
    
    @Binding var solvedChallengeControls: Set<VoiceOverChallengeControls>
    
    @State private var toggleValue = false
    
    var body: some View {
        Toggle("Set this toggle's value to \"On\"", isOn: $toggleValue)
            .onChange(of: toggleValue) { _ in
                solvedChallengeControls.insert(.toggle)
            }
    }
}
