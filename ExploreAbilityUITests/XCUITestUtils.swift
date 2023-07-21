//
//  XCUITestUtils.swift
//  ExploreAbilityUITests
//
//  Created by Jia Chen Yee on 21/7/23.
//

import Foundation
import XCTest

extension XCTestCase {
    func openSettings() -> XCUIApplication {
        let settings = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
        settings.launch()
        
        while settings.navigationBars.buttons.element.exists {
            settings.navigationBars.buttons.element.tap()
        }
        
        return settings
    }
}
