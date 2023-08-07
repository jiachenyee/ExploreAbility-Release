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
    
    var isFeatureToggled: Bool
    
    var body: some View {
        switch challengeViewModel.challenge! {
        case .voiceOver: VoiceOverView(isFeatureToggled: isFeatureToggled)
        case .dynamicType: DynamicTypeChallengeView(isFeatureToggled: isFeatureToggled)
        case .reduceMotion: ReduceMotionView(isFeatureToggled: isFeatureToggled)
        case .increaseContrast: ChallengeHomeButton() // TODO: Add challenge
        case .differentiateWithoutColour: DifferentiateWithoutColorView(isFeatureToggled: isFeatureToggled)
        case .reduceTransparency: ChallengeHomeButton() // TODO: Add challenge
        case .captions: ChallengeHomeButton() // TODO: Add challenge
        case .monoAudio: ChallengeHomeButton() // TODO: Add challenge
        case .assistiveTouch: ChallengeHomeButton() // TODO: Add challenge
        case .shakeToUndo: ShakeToUndoView(isFeatureToggled: isFeatureToggled)
        case .animatedImages: if #available(iOS 17.0, *) { AnimatedImagesChallengeView(isFeatureToggled: isFeatureToggled) }
        case .guidedAccess: GuidedAccessView(isFeatureToggled: isFeatureToggled)
        case .dimFlashingLights: ChallengeHomeButton() // TODO: Add challenge
        default:
            Text("Something went very wrong.")
        }
    }
}
