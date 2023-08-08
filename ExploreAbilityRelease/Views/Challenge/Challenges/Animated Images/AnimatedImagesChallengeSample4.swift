//
//  AnimatedImagesChallengeSample4.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/8/23.
//

import Foundation
import SwiftUI

struct AnimatedImagesChallengeSample4: View {
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    @State private var animationState = false
    
    var body: some View {
        Rectangle()
            .fill(challengeViewModel.challenge.color.opacity(0.15))
            .overlay {
                ZStack {
                    HStack {
                        AnimatedImagesChallengeSample4Eye(animationState: animationState)
                        AnimatedImagesChallengeSample4Eye(animationState: animationState)
                    }
                }
                .padding()
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 2).repeatForever()) {
                    animationState.toggle()
                }
            }
    }
}

struct AnimatedImagesChallengeSample4Eye: View {
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    var animationState: Bool
    
    var body: some View {
        GeometryReader { proxy in
            Ellipse()
                .fill(challengeViewModel.challenge.color.opacity(0.5))
                .overlay {
                    Circle()
                        .fill(.black)
                        .overlay {
                            HStack {
                                Spacer()
                                VStack {
                                    Spacer()
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 5, height: 5)
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                }
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                        }
                        .frame(width: proxy.size.width / 1.8,
                               height: proxy.size.width / 1.8)
                        .frame(maxWidth: .infinity, alignment: animationState ? .leading : .trailing)
                        .padding(.horizontal, 2.5)
                }
            
            Ellipse()
                .stroke(challengeViewModel.challenge.category.color, lineWidth: 5)
        }
        .aspectRatio(12/20, contentMode: .fit)
    }
}
