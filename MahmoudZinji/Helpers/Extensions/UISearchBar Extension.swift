//
//  UISearchBar Extension.swift
//  Storzati
//
//  Created by User on 19/05/2021.
//

import Foundation
import UIKit

extension UISearchBar {
    
    var textField: UITextField? {
        let subViews = subviews.flatMap { $0.subviews }
        return (subViews.filter { $0 is UITextField }).first as? UITextField
    }
    
    func getTextField() -> UITextField? { return value(forKey: "searchField") as? UITextField }
    func setTextField(color: UIColor) {
        guard let textField = getTextField() else { return }
        switch searchBarStyle {
        case .minimal:
            textField.layer.backgroundColor = color.cgColor
            textField.layer.cornerRadius = 6
        case .prominent, .default: textField.backgroundColor = color
        @unknown default: break
        }
    }
}
