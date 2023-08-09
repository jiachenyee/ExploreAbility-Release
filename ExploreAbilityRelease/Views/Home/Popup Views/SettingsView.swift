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
    
    @State private var isResetAllDataPresented = false
    
    @EnvironmentObject var challengePersistenceViewModel: ChallengePersistenceViewModel
    
    var body: some View {
        HomePopupView(id: "settings",
                      systemImage: "switch.2",
                      title: "Settings") {
            ScrollView {
                Toggle(isOn: $eventMode) {
                    Text("Event Mode")
                }
                
                Button("Reset all data") {
                    isResetAllDataPresented.toggle()
                }
                .alert("Reset All Data", isPresented: $isResetAllDataPresented) {
                    Button(role: .destructive) {
                        challengePersistenceViewModel.nuke()
                    } label: {
                        Text("Reset All Data")
                    }
                    
                    Button(role: .cancel) {
                        
                    } label: {
                        Text("Cancel")
                    }
                } message: {
                    Text("You will lose all challenge progress, hints, and any achievements. This is irreversible.")
                }
            }
        }
    }
}
