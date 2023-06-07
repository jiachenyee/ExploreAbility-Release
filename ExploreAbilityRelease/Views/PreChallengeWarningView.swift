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
            
            Text("Accomodations")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
                .padding(.top)
            
            ForEach(warning.modifications, id: \.self) { modification in
                Toggle(modification, isOn: .constant(false))
                    .toggleStyle(.switch)
                
                Divider()
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Start Challenge")
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                
            } label: {
                Text("Exit")
                    .padding()
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
