//
//  VibrationView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/7/23.
//

import SwiftUI
import Buzz

struct VibrationView: View {
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    @State private var firstCircleScale = 0.000001
    @State private var secondCircleScale = 0.000001
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            ChallengeHomeButton()
            
            Circle()
                .fill(challengeViewModel.challenge.color.opacity(1 - firstCircleScale))
                .scaleEffect(firstCircleScale)
            
            Circle()
                .fill(challengeViewModel.challenge.color.opacity(1 - secondCircleScale))
                .scaleEffect(secondCircleScale)
        }
        .onReceive(timer) { _ in
            guard .random() else { return }
            
            if firstCircleScale == 1 {
                secondCircleScale = 0.000001
                
                VibrationHapticPattern().play()
                
                withAnimation(.easeOut(duration: 0.9)) {
                    secondCircleScale = 1
                }
                Timer.scheduledTimer(withTimeInterval: 0.9, repeats: false) { _ in
                    secondCircleScale = 0.000001
                }
            } else {
                firstCircleScale = 0.000001
                
                VibrationHapticPattern().play()
                
                withAnimation(.easeOut(duration: 0.9)) {
                    firstCircleScale = 1
                }
                
                Timer.scheduledTimer(withTimeInterval: 0.9, repeats: false) { _ in
                    firstCircleScale = 0.000001
                }
            }
        }
    }
}
