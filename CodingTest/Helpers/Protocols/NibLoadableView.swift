//
//  NibLoadableView.swift
// CodingTest
//
//  Created by Bezzeg Mihály on 2019.06.21.
//

import Foundation
import UIKit

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
