//
//  FormEventEmitterInterface.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation
import RxSwift

// Event emitter defines the observable events for the module, eg if the values in the form change
public protocol FormEventEmitterInterface {
    func observeFormChange() -> Observable<CollectibleInput>
    func changeFormValue(_ value: CollectibleInput)

    func observeClearForm() -> Observable<Void>
    func clearForm()

    func observeSubmitForm() -> Observable<Void>
    func submitForm()
}
