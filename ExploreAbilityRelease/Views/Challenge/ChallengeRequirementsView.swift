//
//  ChallengeRequirementsView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 13/8/23.
//

import Foundation
import SwiftUI
import UtilMacros

struct ChallengeRequirementsView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "pc")
                    .symbolRenderingMode(.multicolor)
                    .imageScale(.large)
                Text("Challenge Unavailable")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            if let requirement = challengeViewModel.challenge.requirements {
                Text("This challenge involves features only available in **\(requirement.osVersion())** or later.\n\nUpdate your device's operating system to the latest version and try again.\n\nHead to Settings \(Image(systemName: "chevron.right")) General \(Image(systemName: "chevron.right")) Software Update, and install the version of iOS.")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Divider()
            
            Spacer()
            
            Link(destination: #url("https://support.apple.com/guide/iphone/update-ios-iph3e504502/ios")) {
                Text("Update iOS on iPhone: Apple Support")
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
