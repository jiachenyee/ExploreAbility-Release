//
//  ShakeToUndoView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 21/7/23.
//

import Foundation
import SwiftUI
import SpriteKit

struct ShakeToUndoView: View {
    
    @State private var isShakeToUndoEnabled = false
    @State private var initialIsShakeToUndoEnabledState = false
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var didFinishChallenge = false
    
    let publisher = NotificationCenter.default.publisher(for: UIAccessibility.shakeToUndoDidChangeNotification)
    
    var body: some View {
        Group {
            switch challengeViewModel.state {
            case .playing:
                ZStack {
                    GeometryReader { context in
                        SpriteView(scene: ShakeToUndoScene(size: context.size))
                    }
                    
                    ChallengeHomeButton()
                }
                .onChange(of: isShakeToUndoEnabled) { newValue in
                    if newValue != initialIsShakeToUndoEnabledState {
                        withAnimation {
                            challengeViewModel.state = .playingFeatureToggled
                        }
                    }
                }
            case .playingFeatureToggled:
                PlayingFeatureOnView(initialState: initialIsShakeToUndoEnabledState, didSucceed: $didFinishChallenge)
                    .onChange(of: isShakeToUndoEnabled) { newValue in
                        if initialIsShakeToUndoEnabledState == newValue {
                            didFinishChallenge = true
                        }
                    }
            default:
                EmptyView()
            }
        }
        .onReceive(publisher) { _ in
            isShakeToUndoEnabled = UIAccessibility.isShakeToUndoEnabled
        }
        .onAppear {
            isShakeToUndoEnabled = UIAccessibility.isShakeToUndoEnabled
            initialIsShakeToUndoEnabledState = isShakeToUndoEnabled
        }
    }
}
