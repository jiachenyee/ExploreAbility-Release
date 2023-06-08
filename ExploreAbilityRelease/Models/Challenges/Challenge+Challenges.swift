//
//  Challenge+Challenges.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 7/6/23.
//

import Foundation
import SwiftUI

extension Challenge {
    static let vision = [voiceOver, dynamicType, reduceMotion, increaseContrast, differentiateWithoutColour, reduceTransparency]
    
    static let hearing = [captions, monoAudio]
    
    static let mobility = [assistiveTouch, shakeToUndo, vibrationEnabled]
    
    static let cognitive = [animatedImages, guidedAccess, dimFlashingLights]
    
    // vision
    static let voiceOver = Challenge(accessibilityFeature: "VoiceOver",
                                     hint: "<#T##String#>",
                                     postChallengeMessage: "<#T##String#>",
                                     image: Image(systemName: "waveform.and.person.filled"),
                                     color: .teal,
                                     category: .vision)
    
    static let dynamicType = Challenge(accessibilityFeature: "Dynamic Type",
                                       hint: "<#T##String#>",
                                       postChallengeMessage: "<#T##String#>",
                                       image: Image(systemName: "textformat.size"),
                                       color: .teal.opacity(0.9),
                                       category: .vision)
    
    static let reduceMotion = Challenge(accessibilityFeature: "Reduce Motion",
                                        hint: "<#T##String#>",
                                        postChallengeMessage: "<#T##String#>",
                                        image: Image(systemName: "cursorarrow.motionlines"),
                                        color: .teal.opacity(0.8),
                                        category: .vision)
    
    static let increaseContrast = Challenge(accessibilityFeature: "Increase Contrast",
                                            hint: "<#T##String#>",
                                            postChallengeMessage: "<#T##String#>",
                                            image: Image(systemName: "circle.righthalf.filled"),
                                            color: .teal.opacity(0.7),
                                            category: .vision)
    
    static let differentiateWithoutColour = Challenge(accessibilityFeature: "Differentiate Without Colour",
                                                      hint: "<#T##String#>",
                                                      postChallengeMessage: "<#T##String#>",
                                                      image: Image(systemName: "circle.bottomrighthalf.checkered"),
                                                      color: .teal.opacity(0.6),
                                                      category: .vision)
    
    static let reduceTransparency = Challenge(accessibilityFeature: "Reduce Transparency",
                                              hint: "<#T##String#>",
                                              postChallengeMessage: "<#T##String#>",
                                              image: Image(systemName: "square.on.square.intersection.dashed"),
                                              color: .teal.opacity(0.5),
                                              category: .vision)
    
    // hearing
    static let captions = Challenge(accessibilityFeature: "Closed Captions + SDH",
                                    hint: "<#T##String#>",
                                    postChallengeMessage: "<#T##String#>",
                                    image: Image(systemName: "captions.bubble"),
                                    color: .indigo,
                                    category: .hearing)
    
    static let monoAudio = Challenge(accessibilityFeature: "Mono Audio",
                                     hint: "<#T##String#>",
                                     postChallengeMessage: "<#T##String#>",
                                     image: Image(systemName: "ear.badge.waveform"),
                                     color: .indigo.opacity(0.9),
                                     category: .hearing)
    // mobility
    static let assistiveTouch = Challenge(accessibilityFeature: "Assistive Touch",
                                          hint: "<#T##String#>",
                                          postChallengeMessage: "<#T##String#>",
                                          image: Image(systemName: "dot.circle.and.hand.point.up.left.fill"),
                                          color: .cyan,
                                          category: .mobility)
    
    static let shakeToUndo = Challenge(accessibilityFeature: "Shake to Undo",
                                       hint: "<#T##String#>",
                                       postChallengeMessage: "<#T##String#>",
                                       image: Image(systemName: "iphone.gen3.radiowaves.left.and.right"),
                                       color: .cyan.opacity(0.9),
                                       category: .mobility)
    
    static let vibrationEnabled = Challenge(accessibilityFeature: "Vibration",
                                            hint: "<#T##String#>",
                                            postChallengeMessage: "<#T##String#>",
                                            image: Image(systemName: "waveform"),
                                            color: .cyan.opacity(0.8),
                                            category: .mobility)
    
    // cognitive
    static let animatedImages = Challenge(accessibilityFeature: "Animated Images",
                                          hint: "<#T##String#>",
                                          postChallengeMessage: "<#T##String#>",
                                          image: Image(systemName: "photo.on.rectangle.angled"),
                                          color: .pink,
                                          category: .cognitive)
    
    static let guidedAccess = Challenge(accessibilityFeature: "Guided Access",
                                        hint: "<#T##String#>",
                                        postChallengeMessage: "<#T##String#>",
                                        image: Image(systemName: "lock.app.dashed"),
                                        color: .pink.opacity(0.9),
                                        category: .cognitive)
    
    static let dimFlashingLights = Challenge(accessibilityFeature: "Dim Flashing Lights",
                                             hint: "<#T##String#>",
                                             postChallengeMessage: "<#T##String#>",
                                             image: Image(systemName: "exclamationmark.warninglight"),
                                             color: .pink.opacity(0.8),
                                             category: .cognitive,
                                             warning: .flashingLight,
                                             requirements: .iOS17)
}
