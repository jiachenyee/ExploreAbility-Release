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
        case .increaseContrast: IncreaseContrastChallengeView(isFeatureToggled: isFeatureToggled)
        case .differentiateWithoutColour: DifferentiateWithoutColorView(isFeatureToggled: isFeatureToggled)
        case .reduceTransparency: ReduceTransparencyChallengeView(isFeatureToggled: isFeatureToggled)
        case .captions: ChallengeHomeButton() // TODO: Add challenge
        case .monoAudio: MonoAudioChallengeView(isFeatureToggled: isFeatureToggled)
        case .assistiveTouch: AssistiveTouchChallengeView(isFeatureToggled: isFeatureToggled)
        case .shakeToUndo: ShakeToUndoView(isFeatureToggled: isFeatureToggled)
        case .animatedImages: if #available(iOS 17.0, *) { AnimatedImagesChallengeView(isFeatureToggled: isFeatureToggled) }
        case .guidedAccess: GuidedAccessView(isFeatureToggled: isFeatureToggled)
        case .dimFlashingLights: if #available(iOS 17.0, *) { DimFlashingLightsChallengeView(isFeatureToggled: isFeatureToggled) }
        default:
            Text("Something went very wrong.")
        }
    }
}
