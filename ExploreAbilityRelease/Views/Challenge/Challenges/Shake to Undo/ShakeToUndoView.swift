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
    
    var isFeatureToggled: Bool
    
    @State private var isShakeToUndoEnabled = false
    @State private var initialIsShakeToUndoEnabledState = false
    
    @State private var didFinishChallenge = false
    
    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    @EnvironmentObject var viewModel: ViewModel
    
    private let publisher = NotificationCenter.default.publisher(for: UIAccessibility.shakeToUndoDidChangeNotification)
    
    var body: some View {
        Group {
            if !isFeatureToggled {
                ZStack {
                    GeometryReader { context in
                        SpriteView(scene: ShakeToUndoScene(size: context.size))
                    }
                    
                    ChallengeHomeButton()
                }
                .onChange(of: isShakeToUndoEnabled) { newValue in
                    if newValue != initialIsShakeToUndoEnabledState {
                        withAnimation {
                            challengeViewModel.state = .playing(true)
                        }
                    }
                }
            } else {
                PlayingFeatureOnView(initialState: initialIsShakeToUndoEnabledState, didSucceed: $didFinishChallenge)
                    .onChange(of: isShakeToUndoEnabled) { newValue in
                        if initialIsShakeToUndoEnabledState == newValue {
                            didFinishChallenge = true
                        }
                    }
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
