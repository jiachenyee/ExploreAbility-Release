//
//  SettingsView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI
import UtilMacros

struct SettingsView: View {
    
    @AppStorage("eventMode") var eventMode = false
    
    var body: some View {
        HomePopupView(id: "settings",
                      systemImage: "switch.2",
                      title: "Settings") {
            
            ScrollView {
                Toggle(isOn: $eventMode) {
                    Text("Event Mode")
                }
            }
        }
    }
}
