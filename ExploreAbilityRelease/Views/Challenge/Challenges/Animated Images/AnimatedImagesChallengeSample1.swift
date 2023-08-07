//
//  AnimatedImagesChallengeSample1.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/8/23.
//

import Foundation
import SwiftUI

struct AnimatedImagesChallengeSample1: View {
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    @State private var firstRoundedRectangleAngle = Angle.degrees(-32)
    @State private var secondRoundedRectangleAngle = Angle.degrees(32)
    
    var body: some View {
        GeometryReader { proxy in
            let width = min(proxy.size.width / 2, proxy.size.height / 2)
            
            Rectangle()
                .fill(challengeViewModel.challenge.color.opacity(0.2))
                .overlay {
                    HStack(spacing: -width / 3) {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(challengeViewModel.challenge.color.opacity(0.5))
                            .aspectRatio(1, contentMode: .fit)
                            .frame(width: width)
                            .rotationEffect(firstRoundedRectangleAngle)
                        
                        RoundedRectangle(cornerRadius: 16)
                            .fill(challengeViewModel.challenge.color.opacity(0.2))
                            .aspectRatio(1, contentMode: .fit)
                            .frame(width: width)
                            .rotationEffect(secondRoundedRectangleAngle)
                    }
                }
                .clipped()
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1).repeatForever()) {
                firstRoundedRectangleAngle = .degrees(32)
                secondRoundedRectangleAngle = .degrees(-32)
            }
        }
    }
}
