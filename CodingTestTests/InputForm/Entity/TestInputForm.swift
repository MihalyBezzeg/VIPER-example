//
//  Entity.swift
//  CodingTestTests
//
//  Created by Bezzeg Mihály on 2019. 06. 21..
//

import Foundation
@testable import CodingTest

extension InputModel: Equatable {
    public static func ==(lhs: InputModel, rhs: InputModel) -> Bool {
        return lhs.inputType == rhs.inputType && lhs.inputValue == rhs.inputValue
    }
}
