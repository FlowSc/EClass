//
//  ReviewShowTableViewCell.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 20..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class ReviewShowTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var reviewDate: UILabel!
    @IBOutlet weak var reviewContentLb: UILabel!
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func reviewContents(_ reviewDate:String, _ reviewContentLb:String) {
        
        self.reviewDate.text = reviewDate
        self.reviewContentLb.text = reviewContentLb
    }

    
}
