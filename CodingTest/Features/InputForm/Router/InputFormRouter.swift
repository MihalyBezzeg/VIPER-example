//
//  InputFormRouter.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation
import UIKit

// Router is responsible for navigating between componets, eg screen transitions or presenting alert
protocol InputFormRouterInterface {
    func submitForm(message: String)
}

class InputFormRouter: InputFormRouterInterface {
    private let kAlertTitle = "Alert"
    private let kOKTitle = "OK"

    weak var viewController: UIViewController?

    init (_ viewController: UIViewController) {
        self.viewController = viewController
    }

    func submitForm(message: String) {
        let alertController = UIAlertController(title: kAlertTitle, message: message, preferredStyle: .alert)

        let defaultAction = UIAlertAction(title: kOKTitle, style: .default) { (_) in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(defaultAction)

        self.viewController?.present(alertController, animated: true, completion: nil)
    }
}
