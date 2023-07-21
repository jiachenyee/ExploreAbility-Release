//
//  DynamicTypeUITests.swift
//  ExploreAbilityUITests
//
//  Created by Jia Chen Yee on 21/7/23.
//

import XCTest

final class DynamicTypeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOpenAndClose() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Dynamic Type"].tap()
        
        XCTAssertTrue(app.buttons["Menu"].waitForExistence(timeout: 1))
        app.buttons["Menu"].tap()
        
        XCTAssertTrue(app.buttons["Home"].waitForExistence(timeout: 1))
        app.buttons["Home"].tap()
        
        XCTAssertTrue(app.buttons["Zoom to Home"].waitForExistence(timeout: 1))
    }
    
    func testChallengeSolve() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Dynamic Type"].tap()
        
        let settings = openSettings()
        settings.tables.staticTexts["Accessibility"].tap()
        
        settings.tables.staticTexts["Display & Text Size"].tap()
        
        settings.tables.staticTexts["Larger Text"].tap()
        
        let originalPosition = settings.sliders.element.normalizedSliderPosition
        
        settings.cells["Larger Accessibility Sizes"].tap()
        
        settings.sliders.element.adjust(toNormalizedSliderPosition: 1)
    
        app.activate()
        
        XCTAssertTrue(app.staticTexts["Reset"].waitForExistence(timeout: 1))
        
        settings.activate()
        
        settings.cells["Larger Accessibility Sizes"].tap()
        
        settings.sliders.element.adjust(toNormalizedSliderPosition: originalPosition)
        
        app.activate()
        
        XCTAssertTrue(app.buttons["Dismiss"].waitForExistence(timeout: 1))
        
        app.buttons["Dismiss"].tap()
        
        XCTAssertTrue(app.buttons["Zoom to Home"].waitForExistence(timeout: 1))
    }
    
    func openSettings() -> XCUIApplication {
        let settings = XCUIApplication(bundleIdentifier: "com.apple.Preferences")
        settings.launch()
        
        while settings.navigationBars.buttons.element.exists {
            settings.navigationBars.buttons.element.tap()
        }
        
        return settings
    }
}
