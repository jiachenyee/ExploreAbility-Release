//
//  ChallengeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

struct ChallengeView: View {
    
    var challenge: Challenge
    
    @StateObject var challengeViewModel: ChallengeViewModel = ChallengeViewModel()
    
    var body: some View {
        switch challengeViewModel.state {
        case .unknown:
            ProgressView()
                .onAppear {
                    challengeViewModel.challenge = challenge
                }
        case .warning(let warning):
            PreChallengeWarningView(warning: warning)
        case .playingOff:
            switch challengeViewModel.challenge! {
            case .voiceOver: EmptyView()
            case .dynamicType: EmptyView()
            case .reduceMotion: EmptyView()
            case .increaseContrast: EmptyView()
            case .differentiateWithoutColour: EmptyView()
            case .reduceTransparency: EmptyView()
            case .captions: EmptyView()
            case .monoAudio: EmptyView()
            case .assistiveTouch: EmptyView()
            case .shakeToUndo: EmptyView()
            case .vibrationEnabled: EmptyView()
            case .animatedImages: EmptyView()
            case .guidedAccess: EmptyView()
            case .dimFlashingLights: EmptyView()
            default:
                Text("Something went very wrong.")
            }
        case .playingOn:
            EmptyView()
        case .success:
            EmptyView()
        case .menu:
            EmptyView()
        case .conclusion:
            EmptyView()
        }
    }
}
