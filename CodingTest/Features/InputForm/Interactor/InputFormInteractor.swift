//
//  InputFormInteractor.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation

// The interactor represents the business logic layer and stores the data
class InputFormInteractor: InputFormInteractorInterface {
    private var storedModels: [InputModel] = []
    private var inputProvider: InputProviderInterface!

    init(_ inputProvider: InputProviderInterface) {
        self.inputProvider = inputProvider
    }

    func provideInputModels() {
        self.inputProvider.provideInputModels()
    }

    func storeModels(_ inputModels: [InputModel]) {
        self.storedModels = inputModels
    }

    func resetModels() -> [InputModel] {
        for model in self.storedModels {
            model.inputValue = nil
        }

        return self.storedModels
    }

    func convertInputModels(_ rawModels: [String]) -> [InputModel] {
        let parser = InputModelParser()
        var retArray: [InputModel] = []
        for currentRawModel in rawModels {
            guard let parsed = parser.parserInputModel(rawModel: currentRawModel) else {
                continue
            }

            retArray.append(parsed)
        }

        return retArray
    }
}
