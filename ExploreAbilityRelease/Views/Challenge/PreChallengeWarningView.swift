//
//  PreChallengeWarningView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import SwiftUI

struct PreChallengeWarningView: View {
    
    let warning: PreChallengeWarning
    
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundStyle(.yellow)
                    .imageScale(.large)
                Text(warning.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Text(warning.description)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            Form {
                Section("Accomodations") {
                    ForEach(warning.modifications, id: \.self) { modification in
                        let accomodationBinding = Binding {
                            challengeViewModel.accomodations.contains(modification)
                        } set: { newValue in
                            if newValue {
                                challengeViewModel.accomodations.insert(modification)
                            } else {
                                challengeViewModel.accomodations.remove(modification)
                            }
                        }

                        Toggle(modification.rawValue, isOn: accomodationBinding)
                            .toggleStyle(.switch)
                    }
                }
            }
            .padding(.horizontal, -21)
            .padding(.top)
            
            Spacer()
            
            Button {
                withAnimation {
                    challengeViewModel.state = .playing(false)
                }
            } label: {
                Text("Start Challenge")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                withAnimation {
                    viewModel.gameState = .home
                }
            } label: {
                Text("Exit")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding()
    }
}

struct PreChallengeWarningView_Previews: PreviewProvider {
    
    static var previews: some View {
        PreChallengeWarningView(warning: .flashingLight)
            .preferredColorScheme(.dark)
            .fontDesign(.rounded)
    }
}
