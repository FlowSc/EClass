//
//  IntroductionTableViewCell.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 8..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class IntroductionTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var lectureName: UILabel!
    @IBOutlet weak var lectureReviewLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var attendanceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLectureInfo(_ lectureName:String, _ lectureReview:String, _ location:String, _ attandance:String, _ price:String, _ time:String, _ basicInfo:String) {
        
        self.lectureName.text = lectureName
        self.lectureReviewLabel.text = lectureReview
        self.locationLabel.text = location
        self.priceLabel.text = price
        self.attendanceLabel.text = attandance
        self.timeLabel.text = time
        self.infoLabel.text = basicInfo
    }

}
