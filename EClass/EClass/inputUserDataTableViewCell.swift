//
//  inputUserDataTableViewCell.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 9..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class inputUserDataTableViewCell: UITableViewCell {

    @IBOutlet weak var userSettingPropertyLabel: UILabel!
    @IBOutlet weak var userDataTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        userDataTextField.text = "수정"
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func userDataSet(_ data:String)
    {
        userSettingPropertyLabel.text = data
    }
}
