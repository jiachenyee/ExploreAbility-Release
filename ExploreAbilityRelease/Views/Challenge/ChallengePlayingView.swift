//
//  ChallengePlayingView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 11/6/23.
//

import Foundation
import SwiftUI

struct ChallengePlayingView: View {

    @EnvironmentObject var challengeViewModel: ChallengeViewModel
    
    var body: some View {
        switch challengeViewModel.challenge! {
        case .voiceOver: EmptyView()
        case .dynamicType: DynamicTypeChallengeView()
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
    }
}
