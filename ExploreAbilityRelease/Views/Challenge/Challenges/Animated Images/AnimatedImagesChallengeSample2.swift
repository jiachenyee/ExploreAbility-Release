//
//  AnimatedImagesChallengeSample2.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/8/23.
//

import Foundation
import SwiftUI

struct AnimatedImagesChallengeSample2: View {
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    @State private var currentAnimationState = false
    
    var body: some View {
        Rectangle()
            .fill(challengeViewModel.challenge.color.opacity(0.15))
            .overlay {
                Circle()
                    .fill(challengeViewModel.challenge.color.opacity(0.5))
                    .frame(width: 48, height: 48)
                    .frame(maxHeight: .infinity, alignment: currentAnimationState ? .bottom : .top)
            }
            .onAppear {
                withAnimation(.linear.repeatForever()) {
                    currentAnimationState.toggle()
                }
            }
    }
}
