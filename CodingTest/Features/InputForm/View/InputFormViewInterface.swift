//
//  InputFormViewInterface.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation

protocol InputFormViewInterface: class {
    var presenter: InputFormPresenterInterface? { get set }

    func presentInputModels(_ inputModels: [InputModel])
}
