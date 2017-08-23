//
//  RegisterTutorTableViewCell1.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 23..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class RegisterTutorTableViewCell1: UITableViewCell {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var settingLabel: UILabel!
    let labelSetting = ["핸드폰 번호","닉네임","학력","학교 이름","전공","재학 증명","자격증 이름"]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(_ data:Int)
    {
        settingLabel.text = labelSetting[data]
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
