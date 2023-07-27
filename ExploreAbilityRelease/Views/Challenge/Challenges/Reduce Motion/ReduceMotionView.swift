//
//  ReduceMotionView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 13/6/23.
//

import SwiftUI

struct ReduceMotionView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    @Environment(\.accessibilityReduceMotion) var reduceMotionEnabled
    
    @State private var initialReduceMotionEnabled = false
    
    @State private var didFinishChallenge = false
    
    var body: some View {
        switch challengeViewModel.state {
        case .playing:
            ZStack {
                ChallengeHomeButton()
                
                Group {
                    RotatingCircleView(id: "1", distance: 56 * 2, rpm: 0.2)
                    RotatingCircleView(id: "2", distance: 56 * 3, rpm: 0.3)
                    RotatingCircleView(id: "3", distance: 56 * 4, rpm: 0.5)
                    RotatingCircleView(id: "4", distance: 56 * 5, rpm: 0.9)
                    RotatingCircleView(id: "5", distance: 56 * 6, rpm: 0.8)
                    RotatingCircleView(id: "6", distance: 56 * 7, rpm: 1)
                    RotatingCircleView(id: "7", distance: 56 * 8, rpm: 0.7)
                    RotatingCircleView(id: "8", distance: 56 * 9, rpm: 0.6)
                    RotatingCircleView(id: "9", distance: 56 * 10, rpm: 0.5)
                    RotatingCircleView(id: "10", distance: 56 * 11, rpm: 0.4)
                }
            }
            .onAppear {
                initialReduceMotionEnabled = reduceMotionEnabled
            }
            .onChange(of: reduceMotionEnabled) { newValue in
                guard initialReduceMotionEnabled != newValue else { return }
                
                withAnimation {
                    challengeViewModel.state = .playingFeatureToggled
                }
            }
        case .playingFeatureToggled:
            PlayingFeatureOnView(initialState: initialReduceMotionEnabled, didSucceed: $didFinishChallenge)
                .onChange(of: reduceMotionEnabled) { newValue in
                    if initialReduceMotionEnabled == newValue {
                        didFinishChallenge = true
                    }
                }
        default: EmptyView()
        }
    }
}

struct ReduceMotionView_Previews: PreviewProvider {
    static var previews: some View {
        XCChallengePreview(challenge: .reduceMotion) {
            ReduceMotionView()
        }
    }
}
