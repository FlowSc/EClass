//
//  RearSettingTableViewCell.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 11..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class RearSettingTableViewCell: UITableViewCell {

    let settingLabelList = ["수업 검색","수업 목록","FAQ","수업 신청"]
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var settingIconOutlet: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(_ data:Int)
    {
        settingLabel.text = settingLabelList[data]
        settingIconOutlet.image = UIImage(named: "\(data).png")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
