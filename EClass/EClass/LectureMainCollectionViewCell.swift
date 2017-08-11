//
//  LectureMainCollectionViewCell.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 11..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class LectureMainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lectureInfo: UILabel!
    @IBOutlet weak var lecturePrice: UILabel!
    @IBOutlet weak var lectureTitleLabel: UILabel!
    @IBOutlet weak var lectureMainImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func setLecture(_ lectureImage:UIImage, _ lecturePrice:String, _ lectureTitle:String, _ lectureInfo:String){
        self.lectureInfo.text = lectureInfo
        self.lecturePrice.text = lecturePrice
        
        self.lectureMainImage.image = lectureImage
        self.lectureTitleLabel.text = lectureTitle
    }

}
