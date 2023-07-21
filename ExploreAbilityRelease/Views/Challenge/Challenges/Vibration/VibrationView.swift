//
//  VibrationView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/7/23.
//

import SwiftUI

struct VibrationView: View {
    
    let timer = Timer.publish(every: 0.5, on: .current, in: RunLoop.Mode.common)
    
    @State private var circleScale = 0.0
    
    var body: some View {
        ZStack {
            ChallengeHomeButton()
            
            Circle()
                .scaledToFill()
                .scaleEffect(circleScale)
        }
        .onReceive(timer) { _ in
            
            circleScale = 0
            if .random() {
                withAnimation {
                    circleScale = 1
                }
            }
        }
    }
}
