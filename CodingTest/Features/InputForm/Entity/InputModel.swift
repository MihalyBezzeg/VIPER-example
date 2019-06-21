//
//  InputModel.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation

public class InputModel {
    var inputType: InputModelType
    var inputValue: String?

    init(_ type: InputModelType, value: String?) {
        self.inputType = type
        self.inputValue = value
    }
}
