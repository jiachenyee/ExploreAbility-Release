//
//  AnimatedImagesChallengeSample3.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/8/23.
//

import Foundation
import SwiftUI

struct AnimatedImagesChallengeSample3: View {
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    @State private var animationStateActive = true
    
    var body: some View {
        Rectangle()
            .fill(challengeViewModel.challenge.color.opacity(0.1))
            .overlay {
                ZStack(alignment: .top) {
                    VStack {
                        if animationStateActive {
                            Spacer()
                        }
                        HStack {
                            Spacer()
                            Spacer()
                            
                            Circle()
                                .frame(width: 80, height: 80)
                                .foregroundStyle(challengeViewModel.challenge.color)
                            
                            if animationStateActive {
                                Spacer()
                                Spacer()
                            }
                            
                            Spacer()
                        }
                    }
                    
                    Image(systemName: "mountain.2.fill")
                        .resizable()
                        .fontWeight(.ultraLight)
                        .scaledToFill()
                        .foregroundStyle(.black)
                        .padding(.top, 80)
                    
                    Image(systemName: "mountain.2.fill")
                        .resizable()
                        .fontWeight(.ultraLight)
                        .scaledToFill()
                        .foregroundStyle(challengeViewModel.challenge.color.opacity(0.5))
                        .padding(.top, 80)
                }
            }
            .clipped()
            .onAppear {
                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: false)) {
                    animationStateActive.toggle()
                }
            }
    }
}
