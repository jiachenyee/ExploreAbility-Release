//
//  DynamicTypeHelper.swift
//  ExploreAbilityRelease
//
//  Created by Jia Chen Yee on 19/6/23.
//

import Foundation
import SwiftUI

extension DynamicTypeSize {
    var index: Int {
        switch self {
        case .xSmall: 0
        case .small: 1
        case .medium: 2
        case .large: 3
        case .xLarge: 4
        case .xxLarge: 5
        case .xxxLarge: 6
        case .accessibility1: 7
        case .accessibility2: 8
        case .accessibility3: 9
        case .accessibility4: 10
        case .accessibility5: 11
        @unknown default: 12
        }
    }
    
    var offset: Double {
        switch self {
        case .xSmall: 0
        case .small: 20
        case .medium: 40
        case .large: 60
        case .xLarge: 100
        case .xxLarge: 150
        case .xxxLarge: 180
        case .accessibility1: 250
        case .accessibility2: 270
        case .accessibility3: 320
        case .accessibility4: 380
        case .accessibility5: 400
        @unknown default: 12 * 20
        }
    }
    
    var fontSize: Double {
        [6, 8, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 32][index]
    }
    
    func getMessage(initialSize: DynamicTypeSize) -> String {
        guard self.index != 12 else { return "Unknown Size" }
        
        if initialSize.isAccessibilitySize {
            if initialSize == self {
                return "Text too big!"
            } else {
                let messages: [String] = [
                    "You did it!",
                    "Almost there",
                    "This isn't small enough",
                    "Even smaller",
                    "Can we go smaller?",
                    "Slightly smaller?",
                    "Smaller?",
                    "Still too big.",
                    "Smaller…",
                    "Even smaller",
                    "Smaller!",
                    "Way too big.",
                ]
                
                return messages[index]
            }
        } else {
            if initialSize == self {
                return "This text is a little too small"
            } else {
                let messages = [
                    "This is ridiculously small",
                    "This is pretty small",
                    "Maybe a little bigger?",
                    "Can we go bigger?",
                    "As big as we can go",
                    "All the way to the top",
                    "Even bigger!",
                    "Ridiculously HUGE",
                    "BIGGER",
                    "Even larger.",
                    "One more step.",
                    "You did it!"
                ]
                
                return messages[index]
            }
        }
    }
    
    func getCircleBorderWidth(initialSize: DynamicTypeSize) -> Double {
        guard self.index != 12 else { return 8 }
        
        if initialSize.isAccessibilitySize {
            let value = initialSize.index - self.index
            
            if value > 0 {
                return (16 / Double(initialSize.index)) * Double(value) + 8
            } else {
                return 4
            }
            
        } else {
            let value = self.index - initialSize.index
            
            if value > 0 {
                return (16 / Double(12 - initialSize.index)) * Double(value) + 8
            } else {
                return 4
            }
        }
    }
}
