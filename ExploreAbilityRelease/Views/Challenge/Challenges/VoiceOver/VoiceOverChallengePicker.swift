//
//  VoiceOverChallengePicker.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/8/23.
//

import SwiftUI

struct VoiceOverChallengePicker: View {
    
    @Binding var solvedChallengeControls: Set<VoiceOverChallengeControls>
    
    @State private var pickerValue = 0
    
    var body: some View {
        VStack {
            Text("Select Hot Chocolate in this picker")
            Picker("Select Hot Chocolate in this picker", selection: $pickerValue) {
                Text("Apple")
                    .tag(0)
                Text("Banana")
                    .tag(1)
                Text("Hot Chocolate")
                    .tag(2)
            }
            .pickerStyle(.wheel)
            .onChange(of: pickerValue) { newValue in
                if newValue == 2 {
                    solvedChallengeControls.insert(.picker)
                }
            }
        }
    }
}
