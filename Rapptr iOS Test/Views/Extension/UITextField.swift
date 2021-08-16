//
//  UITextField.swift
//  Rapptr iOS Test
//
//  Created by Hector Barrios on 8/15/21.
//

import UIKit

extension UITextField {
    func setup(title: String) {
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 0))
        self.leftViewMode = .always
        self.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        self.layer.cornerRadius = 8.0
        self.textColor = UIColor(named: "primary_black")
        self.attributedPlaceholder = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholder")!])
    }
}
