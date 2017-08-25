//
//  TutorInfoTableViewCell.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 9..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class TutorInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var tutorImage:UIImageView!


    @IBOutlet weak var tutorComent: UILabel!
    @IBOutlet weak var tutorName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tutorImage.clipsToBounds = true
        
        tutorImage.layer.cornerRadius = 30
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTutor(_ image:UIImage, _ tutorName:String, tutorComment:String) {
        self.tutorImage.image = image
        self.tutorName.text = tutorName
        self.tutorComent.text = tutorComment
        
        
    }

}
