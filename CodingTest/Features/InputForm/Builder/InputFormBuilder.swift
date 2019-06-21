//
//  InputFormBuilder.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation
import UIKit

/* InputFormBuilder is responsible to create the InputFormModule from the injected dependencies */
public class InputFormBuilder: InputFormBuilderInterface {
    private var inputProvider: InputProviderInterface!
    private var inputFormEventEmitter: InputFormServiceEventEmitterInterface

    init(_ inputProvider: InputProviderInterface!,
         _ inputFormEventEmitter: InputFormServiceEventEmitterInterface) {
        self.inputProvider = inputProvider
        self.inputFormEventEmitter = inputFormEventEmitter
    }

    public func buildInputFormModule() -> UIViewController? {
        let inputFormViewController = InputFormViewController()
        let interactor = InputFormInteractor(self.inputProvider)
        let router = InputFormRouter(inputFormViewController)
        let presenter = InputFormPresenter(interactor,
                                           router,
                                           inputFormViewController,
                                           inputFormEventEmitter,
                                           DemoFormEventEmitter.shared)

        inputFormViewController.presenter = presenter

        return inputFormViewController
    }
}
