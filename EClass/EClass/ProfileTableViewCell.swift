//
//  ProfileTableViewCell.swift
//  TalingLoginView
//
//  Created by 김태형 on 2017. 8. 3..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var userInfoLabel: UILabel!
    @IBOutlet weak var iconOutlet: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setOutlet()
        // Initialization code
    }
    func setOutlet()
    {
//        iconOutlet.layer.borderWidth = 1
//        iconOutlet.layer.borderColor = UIColor.black.cgColor
//        iconOutlet.borderColorBlack()
        iconOutlet.layer.cornerRadius = 15
    }
    
    func setIcon(data:Int)
    {
        iconOutlet.image = UIImage(named: "\(data).png")
    }
    func setUserInfoLabel(data:String)
    {
        userInfoLabel.text = data
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
