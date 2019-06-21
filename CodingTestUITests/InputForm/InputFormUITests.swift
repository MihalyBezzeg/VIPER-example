//
//  CodingTestUITests.swift
//  CodingTestUITests
//
//  Created by Bezzeg Mihály on 2019. 06. 21..
//

import XCTest

class InputFormUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
    }

    func testInputCells() {
        app.launch()
        let displayingSmallCell = app.tables.cells["CodingTest.SmallCell"].exists
        let displayingMediumCell = app.tables.cells["CodingTest.MediumCell"].exists
        XCTAssertTrue(displayingSmallCell && displayingMediumCell)
    }
}
