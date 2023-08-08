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
    
    static let mobility = [assistiveTouch, shakeToUndo]
    
    static let cognitive = [guidedAccess, animatedImages, dimFlashingLights]
    
    // MARK: - 👀 Vision
    static let voiceOver = Challenge(feature: "VoiceOver", category: .vision) {
        Conclusion("VoiceOver is an industry‑leading screen reader that describes exactly what’s happening on your device. Auditory descriptions of onscreen elements help you easily navigate your screen through a Bluetooth keyboard or simple gestures on a touchscreen. And with unique rotor gestures that function like a dial, you can make content such as websites a breeze to browse.\n\nWith on‑device intelligence in iOS, VoiceOver can describe images in full sentences and read aloud text in an image. You can use the Camera and Photos apps with VoiceOver, even if you can’t see the screen. VoiceOver can provide image descriptions, and you can even add your own descriptions using Markup.")
        
        Metadata(image: Image(systemName: "rectangle.3.group.bubble.left"),
                 color: .teal)
        
        Hint(one: "Tap, Swipe, Swipe, Double-Tap.",
             two: "Listen carefully.",
             three: "A helpful voice.")
        
        ReferenceResources([
            .web("Turn on and practice VoiceOver on iPhone",
                 url: #url("https://support.apple.com/guide/iphone/iph3e2e415f/ios")),
            
                .web("Turn on and practice VoiceOver on iPad",
                     url: #url("https://support.apple.com/guide/ipad/ipad9a246898/ipados")),
            
                .web("About the VoiceOver rotor on iPhone, iPad, and iPod touch",
                     url: #url("https://support.apple.com/HT204783")),
            
                .web("Use VoiceOver for images and videos on iPhone",
                     url: #url("https://support.apple.com/guide/iphone/iph37e6b3844/ios")),
            
                .video("How to navigate with VoiceOver",
                       url: #url("https://youtu.be/qDm7GiKra28")),
            
                .video("How to use Screen Curtain with VoiceOver",
                       url: #url("https://youtu.be/lCHdVdocouw")),
            
                .video("How to drag a slider with VoiceOver",
                       url: #url("https://youtu.be/OvmkFfEbewg")),
            
                .video("How to organize apps with the VoiceOver rotor",
                       url: #url("https://youtu.be/w2Ds-I2L6PI")),
            
                .video("How to choose a new voice for VoiceOver on iPhone and iPad",
                       url: #url("https://youtu.be/T6ols9d9urQ")),
            
                .video("How to hear image descriptions in the Camera app on iPhone, iPad, and iPod touch",
                       url: #url("https://youtu.be/UnoeaUpHKxY"))
        ])
    }
    
    static let dynamicType = Challenge(feature: "Dynamic Type", category: .vision) {
        Conclusion("Increase text legibility and visibility with simple font adjustments. Larger Text allows you to adjust the size using an accessibility slider. Or you can turn on Bold Text to give words weight on your screen. Whatever settings you choose are instantly applied to apps that support Larger Dynamic Type.\n\nAdd Text Size in Control Center for quick access to change font size.")
        
        Metadata(image: Image(systemName: "textformat.size"), color: .teal.opacity(0.9))
        
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
                  relatedFrameworks: [.swiftUi]),
            .code("Specifying a text style, design, and weight of a font",
                  snippet: ".font(.system(.body, design: .serif, weight: .bold))",
                  url: #url("https://developer.apple.com/documentation/swiftui/font/system(_:design:weight:)"),
                  relatedFrameworks: [.swiftUi]),
            .code("Listening for Changes in Dynamic Type Size",
                  snippet: "@Environment(\\.dynamicTypeSize) var dynamicTypeSize",
                  url: #url("https://developer.apple.com/documentation/swiftui/environmentvalues/dynamictypesize"),
                  relatedFrameworks: [.swiftUi]),
            .article("Applying Custom Fonts to Text",
                     url: #url("https://developer.apple.com/documentation/swiftui/applying-custom-fonts-to-text/"),
                     relatedFrameworks: [.swiftUi]),
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
            .article("Scaling Fonts Automatically",
                     url: #url("https://developer.apple.com/documentation/uikit/uifont/scaling_fonts_automatically"),
                     relatedFrameworks: [.uiKit]),
            .hig("Typography",
                 url: #url("https://developer.apple.com/design/human-interface-guidelines/typography"))
        ])
    }
    
    static let reduceMotion = Challenge(feature: "Reduce Motion",
                                        category: .vision) {
        Conclusion("When you turn on Reduce Motion, you can decrease the movement of onscreen elements. Some screen actions, such as moving between apps or launching apps, become visually simpler for motion sensitivity or to lessen strain on the eyes.")
        
        Hint(one: "There's a lot going on.",
             two: "Dizzying animations.",
             three: "There's a lot of movement, or… motion.")
        
        Metadata(image: Image(systemName: "cursorarrow.motionlines"),
                 color: .teal.opacity(0.8))
        
        DisableInstructions(Text("Go to **Settings \(Image(systemName: "chevron.right")) Accessibility \(Image(systemName: "chevron.right")) Motion \(Image(systemName: "chevron.right")) Reduce Motion** and toggle Reduce Motion."))
        
        ReferenceResources([
            .web("Stop or reduce motion on iPhone",
                 url: #url("https://support.apple.com/guide/iphone/iph0b691d3ed/ios")),
            .web("Stop or reduce motion on iPad",
                 url: #url("https://support.apple.com/guide/ipad/ipadc509a80c/ipados")),
            .video("How to reduce screen motion on iPhone, iPad, and iPod touch",
                   url: #url("https://youtu.be/8Ddva5UUX2U"))
        ])
    }
    
    static let increaseContrast = Challenge(feature: "Increase Contrast",
                                            category: .vision) {
        Conclusion("Improves colour contrast between app foreground and background colors.")
        
        Hint(one: "What does the text say?",
             two: "Some backgrounds are challenging.",
             three: "Can we fix the colours?")
        
        Metadata(image: Image(systemName: "circle.righthalf.filled"),
                 color: .teal.opacity(0.7))
        
        ReferenceResources([
            .web("Use display and text size preferences on your iPhone, iPad, and iPod touch",
                 url: #url("https://support.apple.com/HT207025")),
            .web("Adjust the display and text size on iPhone",
                 url: #url("https://support.apple.com/guide/iphone/iph3e2e1fb0/")),
            .web("Adjust the display and text size on iPad",
                 url: #url("https://support.apple.com/guide/ipad/ipad9a246013/"))
        ])
    }
    
    static let differentiateWithoutColour = Challenge(feature: "Differentiate Without Colour",
                                                      category: .vision) {
        Conclusion("This setting replaces user interface items that rely on color to convey information with alternatives. For example: Status icons with a green circle and a red circle would appear as a green circle 🟢  and red square 🟥 with Differentiate Without Colour enabled.")
        
        Hint(one: "Every colour looks the same.",
             two: "Not everyone can see colour.",
             three: "Shapes.")
        
        Metadata(image: Image(systemName: "swatchpalette"),
                 color: .teal.opacity(0.6))
        
        DisableInstructions(Text("Go to **Settings \(Image(systemName: "chevron.right")) Accessibility \(Image(systemName: "chevron.right")) Display & Text Size \(Image(systemName: "chevron.right")) Differentiate Without Colour** and toggle Differentiate Without Colour."))
        
        ReferenceResources([
            .web("Use display and text size preferences on your iPhone, iPad, and iPod touch",
                 url: #url("https://support.apple.com/HT207025"))
        ])
    }
    
    static let reduceTransparency = Challenge(feature: "Reduce Transparency",
                                              category: .vision) {
        Conclusion("Improves contrast by reducing transparency and blurs on some backgrounds.")
        
        Hint(one: "That's really distracting.",
             two: "I can't see clearly with that background.",
             three: "I hate blurs and transparencies.")
        
        Metadata(image: Image(systemName: "square.on.square.intersection.dashed"),
                 color: .teal.opacity(0.5))
        
        ReferenceResources([
            .web("Use display and text size preferences on your iPhone, iPad, and iPod touch",
                 url: #url("https://support.apple.com/HT207025")),
            .web("Adjust the display and text size on iPhone",
                 url: #url("https://support.apple.com/guide/iphone/iph3e2e1fb0/")),
            .web("Adjust the display and text size on iPad",
                 url: #url("https://support.apple.com/guide/ipad/ipad9a246013/"))
        ])
    }
    
    // MARK: - 👂 Hearing
    static let captions = Challenge(feature: "Closed Captions + SDH",
                                    category: .hearing) {
        Conclusion("Closed captions are a text transcription of a video’s dialogue, as well as nonverbal communication. Supported in apps like the Apple TV app, closed captions are available in over 40 languages for movies, TV shows, videos, and podcasts — just look for the CC icon. You can even customize captions with different styles and fonts, including styles that are larger and outlined for better legibility.")
        
        Hint(one: "Silent voices.",
             two: "Voices but I can't hear them.",
             three: "Could I read them?")
        
        Metadata(image: Image(systemName: "captions.bubble"),
                 color: .indigo)
        
        ReferenceResources([
            .web("Display subtitles and captions for videos and HomePod announcements on iPhone",
                 url: #url("https://support.apple.com/guide/iphone/iph3e2e23d1/")),
            .web("Display subtitles and captions for videos and HomePod announcements on iPad",
                 url: #url("https://support.apple.com/guide/ipad/ipad9a246b38/")),
            .web("Change the closed captions or language for movies and TV shows in the Apple TV app",
                 url: #url("https://support.apple.com/HT202641"))
        ])
    }
    
    static let monoAudio = Challenge(feature: "Mono Audio",
                                     category: .hearing) {
        Conclusion("Stereo recordings usually have distinct left- and right-channel audio tracks. Mono Audio can help streamline the differences by playing both audio channels in both ears. You can adjust the balance for greater volume in either ear, so you won’t miss a single note of a concert or word of an audiobook.\n\nYou can also turn on noise cancellation even when you’re using only one of your AirPods.")
        
        Hint(one: "Left, Right.",
             two: "One.",
             three: "Never miss a beat.")
        
        Metadata(image: Image(systemName: "earbuds"),
                 color: .indigo.opacity(0.9))
        
        ReferenceResources([
            .web("Adjust the mono audio, balance, and phone noise cancellation settings on iPhone",
                 url: #url("https://support.apple.com/guide/iphone/iph3e2e2cdc/")),
            .web("Adjust the mono audio and balance settings on iPad",
                 url: #url("https://support.apple.com/guide/ipad/ipad9a246ed2/")),
            .web("Play the same sound in both of your AirPods",
                 url: #url("https://support.apple.com/guide/airpods/dev2b840e13e/web"))
        ])
    }
    
    // MARK: - 👋 Mobility
    static let assistiveTouch = Challenge(feature: "AssistiveTouch",
                                          category: .mobility) {
        Conclusion("Adapt your touchscreen to ﬁt your physical needs. If certain gestures, like pinch or tap, don’t work for you, swap them with a gesture that does or create a touch that’s all your own. You can customize the layout of the AssistiveTouch menu too, or create an alternative to pressing the Home button — a simple onscreen tap. And you can connect a Bluetooth mouse or joystick to control an onscreen pointer for navigation.\n\niPhone and iPad performs a selected action when you hold the cursor still on a screen element or an area of the screen, this is called Dwell Control and can be set up under AssistiveTouch.")
        
        Hint(one: "Gestures are a challenge.",
             two: "Buttons can be challenging too.",
             three: "Touch is hard.")
        
        Metadata(image: Image(systemName: "dot.circle.and.hand.point.up.left.fill"),
                 color: .cyan)
        
        ReferenceResources([
            .web("Use AssistiveTouch on your iPhone, iPad, or iPod touch",
                 url: #url("https://support.apple.com/HT202658")),
            .web("Use AssistiveTouch on iPad",
                 url: #url("https://support.apple.com/guide/ipad/ipad9a2466d3/")),
            .web("Connect a Bluetooth mouse or trackpad to your iPad",
                 url: #url("https://support.apple.com/HT211009")),
            .video("How to use AssistiveTouch on your iPhone",
                   url: #url("https://youtu.be/_j4-NTg3QsE")),
            .video("How to customize AssistiveTouch",
                   url: #url("https://youtu.be/3id4BJ4eSQg"))
        ])
    }
    
    static let shakeToUndo = Challenge(feature: "Shake to Undo",
                                       category: .mobility) {
        Conclusion("If you have difficulties with hand tremors, dexterity, or fine motor control, you can turn off Shake to Undo if you unintentionally shake it.")
        
        Hint(one: "Shake.",
             two: "Undo Typing",
             three: "Unintentional shakes.")
        
        Metadata(image: Image(systemName: "iphone.gen3.radiowaves.left.and.right"),
                 color: .cyan.opacity(0.9))
    }
    
    // MARK: - 🧠 Cognitive
    static let guidedAccess = Challenge(feature: "Guided Access",
                                        category: .cognitive) {
        Conclusion("Guided Access helps you stay focused on the task (or app) at hand. You can limit a device to stay on one app at a time by disabling the Home button. You can even restrict access to the keyboard or touch input on certain areas of the screen so wandering taps and gestures won’t distract. Whether you’re a parent, a teacher, or just trying to help yourself focus, you have all the options you need to customize your experience on Apple products.")
        
        Hint(one: "Don't leave me.",
             two: "You're trapped here!",
             three: "Until you enter a password.")
        
        Metadata(image: Image(systemName: "lock.iphone"),
                 color: .pink)
        
        ReferenceResources([
            .web("Use Guided Access with iPhone, iPad, and iPod touch", url: #url("https://support.apple.com/HT202612")),
            .video("How to use Guided Access on iPad",
                   url: #url("https://youtu.be/JkDtljBD1Fw"))
        ])
    }
    
    static let animatedImages = Challenge(feature: "Animated Images",
                                          category: .cognitive) {
        Conclusion("The Animated Images setting allows you to control whether to play animated images like GIFs on the web and in apps. By default, the setting is on, which allows animated images to play automatically. Turn off the setting to indicate that you want to pause animated images on your device.")
        
        Hint(one: "There's a lot going on.",
             two: "Can we stop some of this animation?",
             three: "It's pronounced GIF not GIF.")
        
        Metadata(image: Image(systemName: "photo.on.rectangle.angled"),
                 color: .pink.opacity(0.9))
        
        ChallengeRequirement.iOS17
    }
    
    static let dimFlashingLights = Challenge(feature: "Dim Flashing Lights",
                                             category: .cognitive) {
        Conclusion("Dim Flashing Lights setting allows you to avoid bright, frequent flashes of light in the media. The Dim Flashing Lights setting allows the system to calculate, mitigate, and inform you about flashing lights in a piece of media.")
        
        Hint(one: "Flickers.",
             two: "Flashing Lights.",
             three: "Videos.")
        
        Metadata(image: Image(systemName: "sun.max.trianglebadge.exclamationmark"),
                 color: .pink.opacity(0.8))
        
        ChallengeRequirement.iOS17
    }
}
