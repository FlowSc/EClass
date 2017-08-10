//
//  LectureIntroTableViewCell.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 10..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class LectureIntroTableViewCell: UITableViewCell {

    @IBOutlet weak var expandableCell: UILabel!
    @IBOutlet weak var shortDetail: UILabel!
    @IBOutlet weak var longDetail: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDetail(_ short:String, _ long:String) {
        self.shortDetail.text = short
        self.longDetail.text = long
        
        let detailShown = false
        self.longDetail.isHidden = !detailShown
        self.expandableCell.text = detailShown ? "더보기" : "줄이기"
    }
}
