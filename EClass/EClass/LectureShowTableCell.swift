//
//  LectureShowTableCell.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 20..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import Kingfisher

class LectureShowTableCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var reviewerImage: UIImageView!
    @IBOutlet weak var reviewerName: UILabel!
    @IBOutlet weak var reviewDate: UILabel!
    @IBOutlet weak var reviewContentLb: UILabel!
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func reviewContents(_ reviewerImage:String, _ reviewName:String, _ reviewDate:String, _ reviewContentLb:String) {
        
        self.reviewerImage.kf.setImage(with: URL(string: reviewerImage))
        self.reviewerName.text = reviewName
        self.reviewDate.text = reviewDate
        self.reviewContentLb.text = reviewContentLb
    }
    
    
    
}
