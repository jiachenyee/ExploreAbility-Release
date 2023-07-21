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
    static let vision = [voiceOver, dynamicType, reduceMotion, increaseContrast, differentiateWithoutColour, reduceTransparency]
    
    static let hearing = [captions, monoAudio]
    
    static let mobility = [assistiveTouch, shakeToUndo, vibrationEnabled]
    
    static let cognitive = [animatedImages, guidedAccess, dimFlashingLights]
    
    // vision
    static let voiceOver = Challenge(accessibilityFeature: "VoiceOver",
                                     hint: "<#T##String#>",
                                     postChallengeMessage: "<#T##String#>",
                                     image: Image(systemName: "rectangle.3.group.bubble.left"),
                                     color: .teal,
                                     category: .vision,
                                     disableInstructions: Text("<#AttributedString#>"))
    
    static let dynamicType = Challenge(accessibilityFeature: "Dynamic Type",
                                       hint: "<#T##String#>",
                                       postChallengeMessage: "Increase text legibility and visibility with simple font adjustments. Larger Text allows you to adjust the size using an accessibility slider. Or you can turn on Bold Text to give words weight on your screen. Whatever settings you choose are instantly applied to apps that support Larger Dynamic Type.\n\nAdd Text Size in Control Center for quick access to change font size.",
                                       image: Image(systemName: "textformat.size"),
                                       color: .teal.opacity(0.9),
                                       category: .vision,
                                       disableInstructions: Text("<#AttributedString#>"),
                                       resources: [
                                        ReferenceResource(title: "Change the font size on your iPhone, iPad, and iPod touch",
                                                          url: #url("https://support.apple.com/HT202828")),
                                        ReferenceResource(title: "Apps, settings and features that you can use from Control Center",
                                                          url: #url("https://support.apple.com/HT210981")),
                                        ReferenceResource(title: "How to adjust text size on iPhone or iPad",
                                                          url: #url("https://youtu.be/_R0mpzMkSjI"),
                                                          type: .video),
                                        ReferenceResource(title: "How to Customize Control Center",
                                                          url: #url("https://youtu.be/_x7qjGJ9kZg"),
                                                          type: .video),
                                        ReferenceResource(title: "How to add accessibility features to Control Center on iPhone, iPad, and iPod touch",
                                                          url: #url("https://youtu.be/nH7hbMEHi2M"),
                                                          type: .video)
                                       ],
                                       developerResources: [
                                        DeveloperReference(title: "Using Built-In Text Styles",
                                                           body: "Built-in text styles are just like text hierarchies in tools like Keynote or Pages. They allow you to define pieces of texts as a title, headline, subheadline, caption, and more. This ensures your app's typography looks and feels the same as other apps and the operating system.\n\nText styles provide additional context, such as text hierarchy, and support Dynamic Type without additional modifications.",
                                                           type: .title),
                                        DeveloperReference(title: "Applying Custom Fonts to Text",
                                                           url: #url("https://developer.apple.com/documentation/swiftui/applying-custom-fonts-to-text/"),
                                                           relatedFrameworks: [.swiftUi],
                                                           type: .documentationArticle),
                                        DeveloperReference(title: "Retrieving UIFont with a text style",
                                                           codeSnippet: "UIFont.preferredFont(forTextStyle: .body)",
                                                           url: #url("https://developer.apple.com/documentation/uikit/uifont/1619030-preferredfont"),
                                                           relatedFrameworks: [.uiKit]),
                                        DeveloperReference(title: "Retrieving Preferred Content Size",
                                                           codeSnippet: "UIApplication.shared.preferredContentSizeCategory",
                                                           url: #url("https://developer.apple.com/documentation/uikit/uiapplication/1623048-preferredcontentsizecategory"),
                                                           relatedFrameworks: [.uiKit],
                                                           type: .codeSnippet),
                                        DeveloperReference(title: "Listening for Changes in Preferred Content Size",
                                                           codeSnippet: "UIApplication.shared.preferredContentSizeCategory",
                                                           url: #url("https://developer.apple.com/documentation/uikit/uicontentsizecategory/1622948-didchangenotification"),
                                                           relatedFrameworks: [.uiKit],
                                                           type: .codeSnippet),
                                        DeveloperReference(title: "Scaling Fonts Automatically",
                                                           url: #url("https://developer.apple.com/documentation/uikit/uifont/scaling_fonts_automatically"),
                                                           relatedFrameworks: [.uiKit],
                                                           type: .documentationArticle),
                                        DeveloperReference(title: "Typography",
                                                           url: #url("https://developer.apple.com/design/human-interface-guidelines/typography"),
                                                           type: .hig)
                                       ])
    
    static let reduceMotion = Challenge(accessibilityFeature: "Reduce Motion",
                                        hint: "<#T##String#>",
                                        postChallengeMessage: "<#T##String#>",
                                        image: Image(systemName: "cursorarrow.motionlines"),
                                        color: .teal.opacity(0.8),
                                        category: .vision,
                                        disableInstructions: Text("Go to **Settings \(Image(systemName: "chevron.right")) Accessibility \(Image(systemName: "chevron.right")) Motion \(Image(systemName: "chevron.right")) Reduce Motion** and toggle Reduce Motion."))
    
    static let increaseContrast = Challenge(accessibilityFeature: "Increase Contrast",
                                            hint: "<#T##String#>",
                                            postChallengeMessage: "<#T##String#>",
                                            image: Image(systemName: "circle.righthalf.filled"),
                                            color: .teal.opacity(0.7),
                                            category: .vision)
    
    static let differentiateWithoutColour = Challenge(accessibilityFeature: "Differentiate Without Colour",
                                                      hint: "<#T##String#>",
                                                      postChallengeMessage: "<#T##String#>",
                                                      image: Image(systemName: "swatchpalette"),
                                                      color: .teal.opacity(0.6),
                                                      category: .vision,
                                                      disableInstructions: Text("Go to **Settings \(Image(systemName: "chevron.right")) Accessibility \(Image(systemName: "chevron.right")) Display & Text Size \(Image(systemName: "chevron.right")) Differentiate Without Colour** and toggle Differentiate Without Colour."))
    
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
                                     image: Image(systemName: "earbuds"),
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
                                        image: Image(systemName: "lock.iphone"),
                                        color: .pink.opacity(0.9),
                                        category: .cognitive)
    
    static let dimFlashingLights = Challenge(accessibilityFeature: "Dim Flashing Lights",
                                             hint: "<#T##String#>",
                                             postChallengeMessage: "<#T##String#>",
                                             image: Image(systemName: "sun.max.trianglebadge.exclamationmark"),
                                             color: .pink.opacity(0.8),
                                             category: .cognitive,
                                             warning: .flashingLight,
                                             requirements: .iOS17)
}
