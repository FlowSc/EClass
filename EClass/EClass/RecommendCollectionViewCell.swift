//
//  RecommendCollectionViewCell.swift
//  TeamProject6
//
//  Created by Kang Seongchan on 2017. 8. 1..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lectureImage:UIImageView!
    @IBOutlet weak var lectureName:UILabel!
    @IBOutlet weak var lectureInfo:UILabel!
    @IBOutlet weak var tutorImage:UIImageView!
    @IBOutlet weak var tutorName:UILabel!
    @IBOutlet weak var tutorNickname:UILabel!
    
    func setLecture(_ lectureImage:UIImage, _ lectureName:String, _ lectureInfo:String, _ tutorImage:UIImage, _ tutorName:String, _ tutorNickname:String)
    {
        self.lectureImage.image = lectureImage
        self.lectureName.text = lectureName
        self.lectureInfo.text = lectureInfo
        self.tutorImage.image = tutorImage
        self.tutorName.text = tutorName
        self.tutorNickname.text = tutorNickname
    }
 
    
}
