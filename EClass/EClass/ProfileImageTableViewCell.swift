//
//  ProfileImageTableViewCell.swift
//  TalingLoginView
//
//  Created by 김태형 on 2017. 8. 3..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class ProfileImageTableViewCell: UITableViewCell {


    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileImageOutlet: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageOutlet.layer.borderColor = UIColor.black.cgColor
        profileImageOutlet.layer.cornerRadius = 32
        profileImageOutlet.layer.borderWidth = 1
//        userNameLabel = 
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
