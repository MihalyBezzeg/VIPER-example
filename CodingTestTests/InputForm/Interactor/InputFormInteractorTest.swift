//
//  InputFormInteractorTest.swift
//  CodingTestTests
//
//  Created by Bezzeg Mihály on 2019. 06. 21..
//

import XCTest
@testable import CodingTest

class InputFormInteractorTest: XCTestCase {
    func testConvertInputModels() {
        let provider = TestInputProvider()
        let interactor = InputFormInteractor(provider)
        let convertedData = interactor.convertInputModels(TestInputProvider.kTestData)

        let expected: [InputModel] = [InputModel(.smallInput, value: nil),
                                      InputModel(.mediumInput, value: nil)]

        XCTAssert(expected == convertedData)
    }

    func testProvideInputModelsCalled() {
        let provider = TestInputProvider()
        let interactor = InputFormInteractor(provider)
        interactor.provideInputModels()

        XCTAssert(provider.provideMethodCalled == true)
    }

}
