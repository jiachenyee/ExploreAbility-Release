//
//  AnimatedImagesChallengeView.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/8/23.
//

import Foundation
import SwiftUI

@available(iOS 17.0, *)
struct AnimatedImagesChallengeView: View {
    var isFeatureToggled: Bool
    
    @Environment(\.accessibilityPlayAnimatedImages) var playAnimatedImages
    
    var body: some View {
        if !isFeatureToggled {
            ChallengeHomeButton()
        } else {
            EmptyView()
        }
    }
}
