//
//  InputFormInteractorInterface.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation

protocol InputFormInteractorInterface {
    func provideInputModels()
    func storeModels(_ inputModels: [InputModel])
    func resetModels() -> [InputModel]
    func convertInputModels(_ rawModels: [String]) -> [InputModel]
}
