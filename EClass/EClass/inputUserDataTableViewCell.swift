//
//  InputUserDataTableViewCell.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 10..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class InputUserDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userSettingPropertyLabel: UILabel!
    @IBOutlet weak var userDataTextField: UITextField!
    let userData = DataCenter.shared.realUser
    override func awakeFromNib() {
        super.awakeFromNib()
//        dump(userData)
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func userDataSet(_ data:String)
    {
        userSettingPropertyLabel.text = data
//        if userSettingPropertyLabel.text == "닉네임"
//        {
//            userDataTextField.text = userData?.nickName ?? ""
//        }else if userSettingPropertyLabel.text == "이메일"
//        {
//            userDataTextField.text = userData?.email ?? ""
//        }else
//        {
//            userDataTextField.text = userData?.phone ?? ""
//        }
    }
}
