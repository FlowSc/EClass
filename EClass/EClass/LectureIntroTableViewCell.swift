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
    
    
    func setValues(_ Lecture:LectureInfo) {
        self.shortDetail.text = Lecture.shortDescription
        self.longDetail.text = Lecture.longDescription
        let detailshwon = Lecture.detailShown
        self.longDetail.isHidden = !detailshwon
        
        self.expandableCell.text = detailshwon ? "그만보기" : "더보기"
    }
}
