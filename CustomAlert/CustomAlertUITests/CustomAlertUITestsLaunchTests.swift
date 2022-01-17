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
        
        app.navigationBars["Waiting Tasks"].buttons["Add"].tap()
        
        let titleInput = app.alerts["Create a new item"].textFields.element(boundBy: 0)
        titleInput.typeText("Title Value")
        
        let descriptionInput = app.alerts["Create a new item"].textFields.element(boundBy: 1)
        descriptionInput.tap()
        descriptionInput.typeText("Description Value")
        
//        let priorityInput = app.alerts["Create a new item"].textFields.element(boundBy: 2)
//        priorityInput.tap()
//        app.pickers.element(boundBy: 0).pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: "Low")
//
//        let dateInput = app.alerts["Create a new item"].textFields.element(boundBy: 3)
//        dateInput.tap()
//        dateInput.datePickers.element(boundBy: 0)
//        let now = Date()
//        let nowString = DateFormatter().string(from: now)
//        dateInput.typeText(nowString)
        //var number =  makeSut().allTodoItems.count
        app.alerts["Create a new item"].buttons["Create"].tap()
        //number = makeSut().allTodoItems.count
        let attachment = XCTAttachment(screenshot: app.screenshot())
//        attachment.name = "Launch Screen"
//        attachment.lifetime = .keepAlways
//        add(attachment)
    }
    
}

//extension CustomAlertUITestsLaunchTests{
//
//    typealias Sut = DataStore
//
//    func makeSut() -> (Sut) {
//        let sut: Sut = .init()
//
//        return sut
//    }
//}

