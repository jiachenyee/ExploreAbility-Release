//
//  AnimatedImagesChallengeSample5.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/8/23.
//

import Foundation
import SwiftUI

struct AnimatedImagesChallengeSample5: View {
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    @State private var heartScale = 0.8
    
    var body: some View {
        Rectangle()
            .fill(challengeViewModel.challenge.color.opacity(0.1))
            .overlay {
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(heartScale)
                    .foregroundStyle(challengeViewModel.challenge.color)
                    .padding()
            }
            .clipped()
            .onAppear {
                playHeartbeat()
                
                Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { _ in
                    playHeartbeat()
                }
            }
    }
    
    func playHeartbeat() {
        withAnimation(.easeOut(duration: 0.2)) {
            heartScale = 1
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            withAnimation(.easeIn(duration: 0.2)) {
                heartScale = 0.8
            }
        }
    }
}
