//
//  Challenge+Challenges.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI
import UtilMacros

extension Challenge {
    
    static let all = vision + hearing + mobility + cognitive
    
    static let vision = [voiceOver, dynamicType, reduceMotion, increaseContrast, differentiateWithoutColour, reduceTransparency]
    
    static let hearing = [captions, monoAudio]
    
    static let mobility = [assistiveTouch, shakeToUndo]
    
    static let cognitive = [guidedAccess, animatedImages, dimFlashingLights]
}
