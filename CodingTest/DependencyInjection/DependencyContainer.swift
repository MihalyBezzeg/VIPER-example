//
//  DependencyContainer.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation
import Swinject

extension Container {
    static let sharedContainer: Container = {
        let container = Container()

        registerInputFormService(container)
        registerInputFormModule(container)

        return container
    }()

    private static func registerInputFormService(_ container: Container) {
        InputFormService.initializeModule(container)
    }

    private static func registerInputFormModule(_ container: Container) {
        InputFormModule.initializeModule(container)
    }
}
