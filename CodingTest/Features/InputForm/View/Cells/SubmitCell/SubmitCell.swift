//
//  SubmitCell.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class SubmitCell: UITableViewCell {
    private let disposeBag = DisposeBag()

    @IBOutlet weak private var clearButton: UIButton!
    @IBOutlet weak private var alertButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.bindClearAction()
        self.bindSubmitAction()
    }

    private func bindClearAction() {
        clearButton
            .rx
            .tap
            .subscribe({_ in
                DemoFormEventEmitter.shared.clearForm()
            })
            .disposed(by: self.disposeBag)
    }

    private func bindSubmitAction() {
        alertButton
            .rx
            .tap
            .subscribe({_ in
                DemoFormEventEmitter.shared.submitForm()
            })
            .disposed(by: self.disposeBag)
    }
}

extension SubmitCell: NibLoadableView {}
