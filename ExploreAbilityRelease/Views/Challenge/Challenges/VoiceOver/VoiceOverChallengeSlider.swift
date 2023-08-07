//
//  VoiceOverChallengeSlider.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/8/23.
//

import SwiftUI

struct VoiceOverChallengeSlider: View {
    
    @Binding var solvedChallengeControls: Set<VoiceOverChallengeControls>
    
    @State private var sliderValue = 1.0
    
    var body: some View {
        Slider(value: $sliderValue) {
            Text("Set this slider's value to 0.5")
        }
        .onChange(of: sliderValue) { newValue in
            if newValue == 0.5 {
                solvedChallengeControls.insert(.slider)
            }
        }
    }
}
