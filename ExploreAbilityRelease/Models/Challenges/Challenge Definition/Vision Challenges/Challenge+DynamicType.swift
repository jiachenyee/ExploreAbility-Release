//
//  Challenge+DynamicType.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 9/8/23.
//

import Foundation
import SwiftUI
import UtilMacros

extension Challenge {
    static let dynamicType = Challenge(feature: "Dynamic Type", category: .vision) {
        Conclusion("Increase text legibility and visibility with simple font adjustments. Larger Text allows you to adjust the size using an accessibility slider. Or you can turn on Bold Text to give words weight on your screen. Whatever settings you choose are instantly applied to apps that support Larger Dynamic Type.\n\nAdd Text Size in Control Center for quick access to change font size.")
        
        Metadata(systemName: "textformat.size",
                 color: .teal.opacity(0.9))
        
        Hint(one: "Didn't bring your glasses?",
             two: "Can't read clearly?",
             three: "Make text bigger.")
        
        ReferenceResources([
            .web("Change the font size on your iPhone, iPad, and iPod touch",
                 url: #url("https://support.apple.com/HT202828")),
            .web("Apps, settings and features that you can use from Control Center",
                 url: #url("https://support.apple.com/HT210981")),
            .video("How to adjust text size on iPhone or iPad",
                   url: #url("https://youtu.be/_R0mpzMkSjI")),
            .video("How to Customize Control Center",
                   url: #url("https://youtu.be/_x7qjGJ9kZg")),
            .video("How to add accessibility features to Control Center on iPhone, iPad, and iPod touch",
                   url: #url("https://youtu.be/nH7hbMEHi2M"))
        ])
        
        DeveloperResources([
            .header("Using Built-In Text Styles",
                    body: "Built-in text styles are just like text hierarchies in tools like Keynote or Pages. They allow you to define pieces of texts as a title, headline, subheadline, caption, and more. This ensures your app's typography looks and feels the same as other apps and the operating system.\n\nText styles provide additional context, such as text hierarchy, and support Dynamic Type without additional modifications."),
            .code("Using Standard Fonts",
                  snippet: ".font(.largeTitle)",
                  body: "Standard fonts help to provide consistency with the rest of the operating system, as well as support Accessibility features such as dynamic type out of the box.",
                  url: #url("https://developer.apple.com/documentation/swiftui/font"),
                  relatedFrameworks: [.swiftUI]),
            .code("Specifying a text style, design, and weight of a font",
                  snippet: ".font(.system(.body, design: .serif, weight: .bold))",
                  url: #url("https://developer.apple.com/documentation/swiftui/font/system(_:design:weight:)"),
                  relatedFrameworks: [.swiftUI]),
            .code("Listening for Changes in Dynamic Type Size",
                  snippet: "@Environment(\\.dynamicTypeSize) var dynamicTypeSize",
                  url: #url("https://developer.apple.com/documentation/swiftui/environmentvalues/dynamictypesize"),
                  relatedFrameworks: [.swiftUI]),
            .article("Applying Custom Fonts to Text",
                     url: #url("https://developer.apple.com/documentation/swiftui/applying-custom-fonts-to-text/"),
                     relatedFrameworks: [.swiftUI]),
            .code("Retrieving UIFont with a text style",
                  snippet: "UIFont.preferredFont(forTextStyle: .body)",
                  url: #url("https://developer.apple.com/documentation/uikit/uifont/1619030-preferredfont"),
                  relatedFrameworks: [.uiKit]),
            .code("Retrieving Preferred Content Size",
                  snippet: "UIApplication.shared.preferredContentSizeCategory",
                  url: #url("https://developer.apple.com/documentation/uikit/uiapplication/1623048-preferredcontentsizecategory"),
                  relatedFrameworks: [.uiKit]),
            .code("Listening for Changes in Preferred Content Size",
                  snippet: "UIApplication.shared.preferredContentSizeCategory",
                  url: #url("https://developer.apple.com/documentation/uikit/uicontentsizecategory/1622948-didchangenotification"),
                  relatedFrameworks: [.uiKit]),
            .article("WWDC21 Challenge: Large Text",
                     url: #url("https://developer.apple.com/news/?id=w6r26g7r"),
                     relatedFrameworks: [.uiKit]),
            .article("Scaling Fonts Automatically",
                     url: #url("https://developer.apple.com/documentation/uikit/uifont/scaling_fonts_automatically"),
                     relatedFrameworks: [.uiKit]),
            .hig("Typography",
                 url: #url("https://developer.apple.com/design/human-interface-guidelines/typography")),
            .video("WWDC19: Visual Design and Accessibility",
                   url: #url("https://developer.apple.com/wwdc19/244"))
        ])
        
        GitHub(#url("https://github.com/jiachenyee/ExploreAbility-Release/tree/main/ExploreAbilityRelease/Views/Challenge/Challenges/Dynamic%20Type"))
    }
}
