//
//  CustomAlertUITestsLaunchTests.swift
//  CustomAlertUITests
//
//  Created by Wagner Santos on 13/01/22.
//

import XCTest
import Foundation

@testable import CustomAlert

class CustomAlertUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        false
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app
        
        app.navigationBar.buttons["Add"].tap()
        
        let titleExpectation = "Title Value"
        app.titleInputField.tap()
        app.titleInputField.typeText(titleExpectation)
        
        let descriptionExpectation = "Description Value"
        app.descriptionInputField.tap()
        app.descriptionInputField.typeText(descriptionExpectation)
        
        app.submitButton.tap()
        
        XCTAssertEqual(app.staticTexts[titleExpectation].label, "Title Value")
        XCTAssertEqual(app.staticTexts[descriptionExpectation].label, "Description Value")
    }
}

private extension XCUIApplication {
    var navigationBar: XCUIElement { self.navigationBars["Waiting Tasks"] }
    var alert: XCUIElement { self.alerts["Create a new item"] }
    var titleInputField: XCUIElement { self.textFields["title-label"] }
    var descriptionInputField: XCUIElement { self.textFields["description-label"] }
    var submitButton: XCUIElement { self.buttons["submit-button"] }
}
