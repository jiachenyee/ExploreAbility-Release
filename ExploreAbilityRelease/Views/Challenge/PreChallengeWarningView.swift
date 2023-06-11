//
//  PreChallengeWarningView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import SwiftUI

struct PreChallengeWarningView: View {
    
    let warning: PreChallengeWarning
    
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
                        Toggle(modification, isOn: .constant(false))
                            .toggleStyle(.switch)
                    }
                }
            }
            .padding(.horizontal, -21)
            .padding(.top)
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Start Challenge")
                    .padding(8)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                
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
