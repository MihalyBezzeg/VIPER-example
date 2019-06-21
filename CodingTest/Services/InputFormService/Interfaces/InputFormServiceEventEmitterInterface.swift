//
//  InputFormEventEmitter.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation
import RxSwift

public protocol InputFormServiceEventEmitterInterface {
    func observeModelChange() -> Observable<[String]>
    func changeInputModel(_ inputModels: [String])
}
