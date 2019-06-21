//
//  TestInputProvider.swift
//  CodingTestTests
//
//  Created by Bezzeg Mihály on 2019. 06. 21..
//

import Foundation
import RxSwift
@testable import CodingTest

class TestInputProvider: InputProviderInterface {
    static let kTestData = ["small", "medium"]

    var provideMethodCalled: Bool = false

    func provideInputModels() {
        provideMethodCalled = true
    }
}
