//
//  DemoInputProvider.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation
import RxSwift

/* Currently DemoInputProvider returns a static array of data, but in the future different providers
 can be implemented (eg using DB layer or network)
 */
class DemoInputProvider: InputProviderInterface {
    private let eventEmitter: InputFormServiceEventEmitterInterface!

    init(_ eventEmitter: InputFormServiceEventEmitterInterface) {
        self.eventEmitter = eventEmitter
    }

    func provideInputModels() {
        self.eventEmitter.changeInputModel(["small", "medium"])
    }
}
