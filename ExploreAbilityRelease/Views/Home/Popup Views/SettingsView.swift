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
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            List {
                
                Toggle(isOn: $eventMode) {
                    Label {
                        Text("Event Mode")
                    } icon: {
                        Image(systemName: "lanyardcard")
                            .foregroundStyle(.green)
                    }

                }
                
                Section {
                    Button {
                        viewModel.gameState = .onboarding
                    } label: {
                        Label {
                            Text("Show Onboarding")
                        } icon: {
                            Image(systemName: "hand.wave")
                                .foregroundStyle(.yellow)
                        }
                        
                    }
                }
                
                Section {
                    Button(role: .destructive) {
                        isResetAllDataPresented.toggle()
                    } label: {
                        Label {
                            Text("Reset All Data")
                        } icon: {
                            Image(systemName: "trash")
                                .foregroundStyle(.red)
                        }

                    }
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
                    Text("You will lose all challenge progress, hints, Game Center achievements, and any achievements. This is irreversible.")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}
