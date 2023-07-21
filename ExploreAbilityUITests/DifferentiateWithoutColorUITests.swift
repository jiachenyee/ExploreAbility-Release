//
//  DifferentiateWithoutColorUITests.swift
//  ExploreAbilityUITests
//
//  Created by Jia Chen Yee on 21/7/23.
//

import XCTest

final class DifferentiateWithoutColorUITests: XCTestCase {
    
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
        
        app.buttons["Differentiate Without Colour"].tap()
        
        XCTAssertTrue(app.buttons["Menu"].waitForExistence(timeout: 1))
        app.buttons["Menu"].tap()
        
        XCTAssertTrue(app.buttons["Home"].waitForExistence(timeout: 1))
        app.buttons["Home"].tap()
        
        XCTAssertTrue(app.buttons["Zoom to Home"].waitForExistence(timeout: 1))
    }
    
    func testChallengeSolve() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Differentiate Without Colour"].tap()
        
        let settings = openSettings()
        settings.tables.staticTexts["Accessibility"].tap()
        
        settings.tables.staticTexts["Display & Text Size"].tap()
        
        settings.cells["Differentiate Without Colour"].tap()
        
        app.activate()
        
        XCTAssertTrue(app.staticTexts["Reset"].waitForExistence(timeout: 1))
        
        settings.activate()
        
        settings.cells["Differentiate Without Colour"].tap()
        
        app.activate()
        
        XCTAssertTrue(app.buttons["Dismiss"].waitForExistence(timeout: 1))
        
        app.buttons["Dismiss"].tap()
        
        XCTAssertTrue(app.buttons["Zoom to Home"].waitForExistence(timeout: 1))
    }
    
    func testChallengePresolved() throws {
        let settings = openSettings()
        
        settings.tables.staticTexts["Accessibility"].tap()
        
        settings.tables.staticTexts["Display & Text Size"].tap()
        
        settings.cells["Differentiate Without Colour"].tap()
        
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Differentiate Without Colour"].tap()
        
        settings.activate()
        
        settings.cells["Differentiate Without Colour"].tap()
        
        app.activate()
        
        XCTAssertTrue(app.staticTexts["Reset"].waitForExistence(timeout: 1))
        
        settings.activate()
        
        settings.cells["Differentiate Without Colour"].tap()
        
        app.activate()
        
        XCTAssertTrue(app.buttons["Dismiss"].waitForExistence(timeout: 1))
        
        app.buttons["Dismiss"].tap()
        
        XCTAssertTrue(app.buttons["Zoom to Home"].waitForExistence(timeout: 1))
        
        settings.activate()
        
        settings.cells["Reduce Motion"].tap()
    }
    
    func testChallengeInteractions() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Differentiate Without Colour"].tap()
        
        app.swipeUp()
        app.swipeDown()
        app.swipeLeft()
        app.swipeRight()
        
        XCTAssertTrue(app.buttons["Menu"].waitForExistence(timeout: 1))
        app.buttons["Menu"].tap()
        
        XCTAssertTrue(app.buttons["Home"].waitForExistence(timeout: 1))
        app.buttons["Home"].tap()
        
        XCTAssertTrue(app.buttons["Zoom to Home"].waitForExistence(timeout: 1))
    }
}
