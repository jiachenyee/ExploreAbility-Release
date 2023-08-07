//
//  AnimatedImagesChallengeSample6.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/8/23.
//

import Foundation
import SwiftUI

struct AnimatedImagesChallengeSample6: View {
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    
    @State private var text = "ASDFGHJKLA"
    
    var body: some View {
        Rectangle()
            .fill(challengeViewModel.challenge.color.opacity(0.15))
            .overlay {
                Text(text)
                    .fontDesign(.monospaced)
                    .font(.system(size: 20, weight: .regular, design: .monospaced))
                    .foregroundStyle(challengeViewModel.challenge.color)
            }
            .onReceive(timer) { _ in
                text = randomCharacters(length: 10)
            }
    }
    
    func randomCharacters(length: Int) -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*()_+-=<>?/\\|{}[]0123456789"
        return String((0..<length).map { _ in letters.randomElement()! })
    }
}
