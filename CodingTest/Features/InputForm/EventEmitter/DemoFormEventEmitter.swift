//
//  FormEventEmitter.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation
import RxSwift

class DemoFormEventEmitter: FormEventEmitterInterface {
    private init() { }
    static let shared = DemoFormEventEmitter()

    private var modelChangeSubject = PublishSubject<CollectibleInput>()
    private var clearActionSubject = PublishSubject<Void>()
    private var submitActionSubject = PublishSubject<Void>()

    func observeFormChange() -> Observable<CollectibleInput> {
        return modelChangeSubject
    }

    func changeFormValue(_ value: CollectibleInput) {
        self.modelChangeSubject.onNext(value)
    }

    func observeClearForm() -> Observable<Void> {
        return clearActionSubject
    }

    func clearForm() {
        self.clearActionSubject.onNext(())
    }

    func observeSubmitForm() -> Observable<Void> {
        return submitActionSubject
    }

    func submitForm() {
        self.submitActionSubject.onNext(())
    }
}
