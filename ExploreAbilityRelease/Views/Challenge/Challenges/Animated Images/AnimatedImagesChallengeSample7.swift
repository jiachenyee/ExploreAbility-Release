//
//  AnimatedImagesChallengeSample7.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/8/23.
//

import Foundation
import SwiftUI

struct AnimatedImagesChallengeSample7: View {
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    @State private var rotationAngle: Angle = .zero
    
    var body: some View {
        Rectangle()
            .fill(challengeViewModel.challenge.color.opacity(0.2))
            .overlay {
                VStack {
                    Spacer()
                    GeometryReader { proxy in
                        Circle()
                            .fill(challengeViewModel.challenge.color.opacity(0.8))
                            .frame(width: 48, height: 48)
                            .frame(width: min(proxy.size.width, proxy.size.height),
                                   height: min(proxy.size.width, proxy.size.height), alignment: .top)
                            .rotationEffect(rotationAngle)
                    }
                    .aspectRatio(1, contentMode: .fit)
                    
                    Spacer()
                }
            }
            .onAppear {
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                    rotationAngle = .degrees(360)
                }
            }
    }
}
