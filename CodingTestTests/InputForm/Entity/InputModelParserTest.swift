//
//  InputModelParserTest.swift
//  CodingTestTests
//
//  Created by Bezzeg Mihály on 2019. 06. 21..
//

import Foundation
import XCTest
@testable import CodingTest

class InputModelParserTest: XCTestCase {
    func testParseSmallValue() {
        let parser = InputModelParser()
        let convertedDate = parser.parserInputModel(rawModel: "small")
        let expectedValue = InputModel(.smallInput, value: nil)

        XCTAssert(convertedDate == expectedValue)
    }

    func testParseMediumValue() {
        let parser = InputModelParser()
        let convertedDate = parser.parserInputModel(rawModel: "medium")
        let expectedValue = InputModel(.mediumInput, value: nil)

        XCTAssert(convertedDate == expectedValue)
    }

    func testParseLargeValue() {
        let parser = InputModelParser()
        let convertedDate = parser.parserInputModel(rawModel: "large")
        let expectedValue = InputModel(.largeInput, value: nil)

        XCTAssert(convertedDate == expectedValue)
    }

    func testParseInvalidValue() {
        let parser = InputModelParser()
        let convertedDate = parser.parserInputModel(rawModel: "invalid")

        XCTAssert(convertedDate == nil)
    }

}
