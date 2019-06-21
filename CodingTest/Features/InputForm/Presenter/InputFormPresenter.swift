//
//  InputFormPresenter.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation
import RxSwift

/* Presenter subscribes for view events and uses interactor to generate the next set of data
 then updates the view
 */
class InputFormPresenter: InputFormPresenterInterface {
    private let interactor: InputFormInteractorInterface
    private let router: InputFormRouterInterface
    private let inputFormServiceEventEmitter: InputFormServiceEventEmitterInterface
    private let formEventEmitter: FormEventEmitterInterface
    private weak var view: InputFormViewInterface?
    private let disposeBag = DisposeBag()
    private var storedForm: [Int: String] = [:]

    required init(_ interactor: InputFormInteractorInterface,
                  _ router: InputFormRouterInterface,
                  _ view: InputFormViewInterface,
                  _ inputFormServiceEventEmitter: InputFormServiceEventEmitterInterface,
                  _ formEventEmitter: FormEventEmitterInterface) {
        self.interactor = interactor
        self.router = router
        self.view = view
        self.inputFormServiceEventEmitter = inputFormServiceEventEmitter
        self.formEventEmitter = formEventEmitter
    }

    func initialize() {
        self.bindInputModelChange()
        self.bindformChange()
        self.bindClearAction()
        self.bindSubmitAction()
        self.interactor.provideInputModels()
    }

    private func bindInputModelChange() {
        self.inputFormServiceEventEmitter
            .observeModelChange()
            .asObservable()
            .subscribe({ [weak self] inputModels in

                guard let inputModels = inputModels.element,
                    let convertedModel = self?.interactor.convertInputModels(inputModels) else {
                    self?.view?.presentInputModels([])
                    return
                }

                self?.interactor.storeModels(convertedModel)
                self?.view?.presentInputModels(convertedModel)

            })
            .disposed(by: self.disposeBag)
    }

    private func bindformChange() {
        self.formEventEmitter
            .observeFormChange()
            .asObservable()
            .subscribe({ [weak self] inputModel in

                guard let inputModel = inputModel.element else {
                    return
                }

                self?.storedForm[inputModel.index] = inputModel.value
            })
            .disposed(by: self.disposeBag)
    }

    private func bindSubmitAction() {
        self.formEventEmitter
            .observeSubmitForm()
            .asObservable()
            .subscribe({ _  in
                var message = ""
                let sortedKeys = Array(self.storedForm.keys).sorted()
                for key in sortedKeys {
                    if let currentMessage = self.storedForm[key], !currentMessage.isEmpty {
                        message += currentMessage + "\n"
                    }
                }

                self.router.submitForm(message: message)
            })
            .disposed(by: self.disposeBag)
    }

    private func bindClearAction() {
        self.formEventEmitter
            .observeClearForm()
            .asObservable()
            .subscribe({ [weak self]  _  in
                if let resetModels = self?.interactor.resetModels() {
                    self?.storedForm = [:]
                    self?.view?.presentInputModels(resetModels)
                }
            })
            .disposed(by: self.disposeBag)
    }
}
