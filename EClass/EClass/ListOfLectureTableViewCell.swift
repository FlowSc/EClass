//
//  ListOfLectureTableViewCell.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 11..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class ListOfLectureTableViewCell: UITableViewCell {

    @IBOutlet weak var priceOfLectureLabel: UILabel!
    @IBOutlet weak var introduceOfLectureLabel: UILabel!
    @IBOutlet weak var lectureImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var tutorProfileImage: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
