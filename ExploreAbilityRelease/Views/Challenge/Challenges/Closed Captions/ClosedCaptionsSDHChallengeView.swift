//
//  ClosedCaptionsSDHChallengeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/8/23.
//

import Foundation
import SwiftUI

struct ClosedCaptionsSDHChallengeView: View {
    
    var isFeatureToggled: Bool
    
    @State private var isClosedCaptioningEnabled = UIAccessibility.isClosedCaptioningEnabled
    
    private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.closedCaptioningStatusDidChangeNotification)
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "questionmark.bubble")
                .font(.system(size: 48))
                .frame(height: 64)
                .padding(.leading, 64)
                .foregroundStyle(challengeViewModel.challenge.color)
            
            ChallengeHomeButton()
            
            Image("person.body")
                .resizable()
                .scaledToFit()
                .foregroundStyle(challengeViewModel.challenge.color.opacity(0.6))
                .frame(height: 41)
                .frame(height: 64, alignment: .top)
        }
    }
}
