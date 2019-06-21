//
//  InputFormViewController.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation
import UIKit
import RxSwift
import RxKeyboard

public class InputFormViewController: UIViewController {
    public var presenter: InputFormPresenterInterface?
    private var inputModels: [InputModel] = []
    private let disposeBag = DisposeBag()

    @IBOutlet weak private var inputFormTableView: UITableView!

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.bindKeyboardChange()
        self.setupTableView()
        self.presenter?.initialize()
    }

    private func setupTableView() {
        self.inputFormTableView.register(SmallCell.self)
        self.inputFormTableView.register(MediumCell.self)
        self.inputFormTableView.register(LargeCell.self)
        self.inputFormTableView.register(SubmitCell.self)
        self.inputFormTableView.separatorColor = UIColor.black
        self.inputFormTableView.allowsSelection = false
        self.inputFormTableView.dataSource = self
        self.inputFormTableView.rowHeight = UITableViewAutomaticDimension
        self.inputFormTableView.estimatedRowHeight = 100
        self.inputFormTableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    private func bindKeyboardChange() {
        RxKeyboard.instance.visibleHeight
            .drive(onNext: { keyboardVisibleHeight in
                self.inputFormTableView.contentInset.bottom = keyboardVisibleHeight
            })
            .disposed(by: disposeBag)
    }
}

extension InputFormViewController: InputFormViewInterface {
    // Update layout when receiving new data
    func presentInputModels(_ inputModels: [InputModel]) {
        self.inputModels = inputModels
        self.inputFormTableView.reloadData()
    }
}

extension InputFormViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == self.inputModels.count {
            let cell: SubmitCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            return cell
        }

        var item = self.inputModels[indexPath.row]

        switch item.inputType {
        case .smallInput:
            let cell: SmallCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.setup(withIndex: indexPath.row, &item)
            return cell

        case .mediumInput:
            let cell: MediumCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.setup(withIndex: indexPath.row, &item)
            return cell

        case .largeInput:
            let cell: LargeCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            cell.setup(withIndex: indexPath.row, &item)
            return cell
        }
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.inputModels.count + 1
    }
}
