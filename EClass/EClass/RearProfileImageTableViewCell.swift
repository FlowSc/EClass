//
//  RearProfileImageTableViewCell.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 11..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class RearProfileImageTableViewCell: UITableViewCell {

    @IBOutlet weak var userProfileImageOutlet: UIImageView!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        userProfileImageOutlet.layer.borderWidth = 1
        userProfileImageOutlet.layer.cornerRadius = 20
        userProfileImageOutlet.clipsToBounds = true
        userProfileImageOutlet.image = UIImage(named: "0.png")
        userEmailLabel.text = currentUserData?.email
        userNameLabel.text = currentUserData?.userName ?? "guest 로그인"
        userProfileImageOutlet.image = currentUserData?.profileImage
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
