//
//  BaseInputCell.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation
import RxSwift
import RxCocoa

// The demo application supports 3 different types of cells with a common base class
class BaseInputCell: UITableViewCell {
    private let disposeBag = DisposeBag()
    private var index: Int!
    private var inputModel: InputModel!

    @IBOutlet weak private var mainView: UIView!
    @IBOutlet weak private var inputTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        accessibilityIdentifier = type(of: self).defaultReuseIdentifier
        self.mainView.layer.cornerRadius = 5
        inputTextField
            .rx
            .text
            .distinctUntilChanged({ prevValue, nextValue  in
                if let prevValue = prevValue,
                    let nextValue = nextValue {
                    return prevValue == nextValue
                }

                return false
            })
            .subscribe({ [weak self]  _  in
                guard
                    let text = self?.inputTextField.text,
                    let index = self?.index else {
                        return
                }

                self?.inputModel.inputValue = text
                let collectible = CollectibleInput(index: index, value: text)
                DemoFormEventEmitter.shared.changeFormValue(collectible)
            })
            .disposed(by: self.disposeBag)
    }

    func setup(withIndex index: Int, _ inputModel: inout InputModel) {
        self.index = index
        self.inputModel = inputModel
        self.inputTextField.text = inputModel.inputValue
    }
}

extension BaseInputCell: NibLoadableView {}
