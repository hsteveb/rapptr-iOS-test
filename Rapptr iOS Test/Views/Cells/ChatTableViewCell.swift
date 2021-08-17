//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit
import SDWebImage

class ChatTableViewCell: UITableViewCell {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Setup cell to match mockup
     *
     * 2) Include user's avatar image
     **/
    
    // MARK: - Outlets
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var bodyView: UIView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public
    func setCellData(message: Message) {
        header.text = message.name
        body.text = message.message
        self.userImage.sd_setImage(with: message.avatar_url, placeholderImage: UIImage())
    }
    
    func setup() {
        //self.userImage.layer.cornerRadius = self.frame.height / 2
        self.userImage.clipsToBounds = true
        self.body.lineBreakMode = .byWordWrapping
        self.body.numberOfLines = 0
        self.bodyView.layer.cornerRadius = 8
        self.bodyView.layer.borderWidth = 1
        self.bodyView.layer.borderColor = UIColor(named: "body_border")?.cgColor
        self.userImage.layer.cornerRadius = self.userImage.frame.width / 2
    }
}
