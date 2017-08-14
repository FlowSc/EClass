//
//  LectureReviewTableViewCell.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 11..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class LectureReviewTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

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
    
//    @IBAction func moveToReviewShowButtonTouched(_ sender: Any) {
//        
//    }
//    @IBAction func moveToReviewAddButtonTouched(_ sender: Any) {
//    }
//}
}


