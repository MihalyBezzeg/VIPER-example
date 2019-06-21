//
//  DemoInputFormEventEmitter.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation
import RxSwift

class DemoInputFormSereviceEventEmitter: InputFormServiceEventEmitterInterface {
    private init() { }
    static let shared = DemoInputFormSereviceEventEmitter()

    private var modelChangeSubject = BehaviorSubject<[String]>(value: [])

    func observeModelChange() -> Observable<[String]> {
        return modelChangeSubject
    }

    func changeInputModel(_ inputModels: [String]) {
        self.modelChangeSubject.onNext(inputModels)
    }
}
