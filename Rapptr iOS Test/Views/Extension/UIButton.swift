//
//  GeneralButton.swift
//  Rapptr iOS Test
//
//  Created by Hector Barrios on 8/14/21.
//

import UIKit

extension UIButton {
    func setup(title: String) {
        self.backgroundColor = UIColor(named: "primary_blue")
        self.setTitle(title.uppercased(), for: .normal)
        self.tintColor = UIColor(named: "white")
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
    }
}
