//
//  InputModelParser.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation

class InputModelParser {
    private let kSmallKey = "small"
    private let kMediumKey = "medium"
    private let kLargeKey = "large"

    func parserInputModel(rawModel: String) -> InputModel? {
        switch rawModel {
        case kSmallKey:
            return InputModel(.smallInput, value: nil)
        case kMediumKey:
            return InputModel(.mediumInput, value: nil)
        case kLargeKey:
            return InputModel(.largeInput, value: nil)
        default:
            return nil
        }
    }
}
