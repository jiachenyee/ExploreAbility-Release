//
//  ChallengePlayingView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 11/6/23.
//

import Foundation
import SwiftUI
import UtilMacros

struct ChallengePlayingView: View {

    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    var body: some View {
        switch challengeViewModel.challenge! {
        case .voiceOver: ChallengeHomeButton() // TODO: Add challenge
        case .dynamicType: DynamicTypeChallengeView()
        case .reduceMotion: ReduceMotionView()
        case .increaseContrast: ChallengeHomeButton() // TODO: Add challenge
        case .differentiateWithoutColour: DifferentiateWithoutColorView()
        case .reduceTransparency: ChallengeHomeButton() // TODO: Add challenge
        case .captions: ChallengeHomeButton() // TODO: Add challenge
        case .monoAudio: ChallengeHomeButton() // TODO: Add challenge
        case .assistiveTouch: ChallengeHomeButton() // TODO: Add challenge
        case .shakeToUndo: ShakeToUndoView()
        case .vibrationEnabled: VibrationView()
        case .animatedImages: ChallengeHomeButton() // TODO: Add challenge
        case .guidedAccess: ChallengeHomeButton() // TODO: Add challenge
        case .dimFlashingLights: ChallengeHomeButton() // TODO: Add challenge
        default:
            Text("Something went very wrong.")
        }
    }
}
