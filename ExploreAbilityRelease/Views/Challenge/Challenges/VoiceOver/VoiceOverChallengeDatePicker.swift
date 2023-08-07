//
//  VoiceOverChallengeDatePicker.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/8/23.
//

import SwiftUI

struct VoiceOverChallengeDatePicker: View {
    
    @Binding var solvedChallengeControls: Set<VoiceOverChallengeControls>
    
    @State private var dateValue = Date.now
    
    var body: some View {
        DatePicker("Set the date to January 1, 2000 at midnight.", selection: $dateValue)
            .datePickerStyle(.graphical)
            .onChange(of: dateValue) { newValue in
                let calendar = Calendar.current
                
                let date = calendar.date(from: DateComponents(calendar: .current, year: 2000, month: 1, day: 1, hour: 0, minute: 0, second: 0))
                
                if newValue == date {
                    solvedChallengeControls.insert(.datePicker)
                }
            }
    }
}
