//
//  InputFormService.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation
import Swinject

// InputFormService will provid the requested data for the InputForViewController
public class InputFormService {
    public static func initializeModule(_ container: Container) {
        let demoInputEmitter = DemoInputFormSereviceEventEmitter.shared

        container.register(InputFormServiceEventEmitterInterface.self) { _ in
            demoInputEmitter
        }

        container.register(InputProviderInterface.self) { _ in
            DemoInputProvider(demoInputEmitter)
        }
    }
}
