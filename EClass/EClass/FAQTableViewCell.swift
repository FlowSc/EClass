//
//  FAQTableViewCell.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 13..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class FAQTableViewCell: UITableViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(_ data1:StudentFAQList?, data2:TutorFAQList?, data3:Int)
    {
        if let data = data1
        {
            questionLabel.text = data.short[data3]
           
        }else
        {
            questionLabel.text = data2?.short[data3]
        }
        
    }
    
}
