//
//  LectureReviewTableViewCell.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 11..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import SwiftyStarRatingView

class LectureReviewTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        firstReviewButton.isHidden = true
        firstReviewRequestLb.isHidden = true
        
    }
    @IBOutlet weak var firstReviewButton: UIButton!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var reviewerImage: UIImageView!
    @IBOutlet weak var moveReviewAddB: UIButton!
    @IBOutlet weak var moveToreviewButton: UIButton!
    @IBOutlet weak var reviewCreateDate: UILabel!
    @IBOutlet weak var reviewerName: UILabel!
    @IBOutlet weak var reviewContents: UILabel!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var countLb: UILabel!
    @IBOutlet weak var reviewScoreLb: UILabel!
    @IBOutlet weak var firstReviewRequestLb: UILabel!
    @IBOutlet weak var reviewStar: SwiftyStarRatingView!
    
    func noReview(){
        
        reviewerName.isHidden = true
        moveReviewAddB.isHidden = true
        moveToreviewButton.isHidden = true
        reviewCreateDate.isHidden = true
        reviewContents.isHidden = true
        reviewerImage.isHidden = true
        titleLb.isHidden = true
        countLb.isHidden = true
        reviewStar.isHidden = true
    }
    
}


