//
//  InputFormModule.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation
import Swinject

public class InputFormModule {
    // Module initializer handles dependency injection for module builder
    public static func initializeModule(_ container: Container) {
        guard
            let inputProvider = container.resolve(InputProviderInterface.self),
            let inputFormServiceEmitter = container.resolve(InputFormServiceEventEmitterInterface.self)
            else {
                return
        }

        container.register(InputFormBuilderInterface.self) { _ in
            InputFormBuilder(inputProvider, inputFormServiceEmitter)
        }
    }
}
