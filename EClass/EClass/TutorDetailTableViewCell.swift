//
//  TutorDetailTableViewCell.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 9..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class TutorDetailTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var tutorBasicInfo: UILabel!
    @IBOutlet weak var tutorDetailInfo: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
