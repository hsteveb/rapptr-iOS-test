//
//  MainMenuButton.swift
//  Rapptr iOS Test
//
//  Created by Hector Barrios on 8/12/21.
//

import UIKit

@IBDesignable
class MainMenuButton: UIButton {
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = UIColor(named: "white_opaque")
        self.layer.cornerRadius = 8.0
        self.setTitle(self.title(for: .normal)?.uppercased(), for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        self.tintColor = UIColor(named: "primary_black")
        self.setTitleColor(UIColor(named: "primary_black"), for: .normal)
        self.imageEdgeInsets.left = 22.0
        self.titleEdgeInsets.left = 38.0
        self.contentHorizontalAlignment = .leading
    }
    
}
