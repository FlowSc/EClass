//
//  RecommendCollectionViewCell.swift
//  TeamProject6
//
//  Created by Kang Seongchan on 2017. 8. 1..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import Kingfisher

class RecommendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lectureImage:UIImageView!
    @IBOutlet weak var lectureName:UILabel!
    @IBOutlet weak var lectureInfo:UILabel!
    @IBOutlet weak var tutorImage:UIImageView!
    @IBOutlet weak var tutorName:UILabel!
    @IBOutlet weak var tutorNickname:UILabel!
    
    func setLecture(_ lectureImage:String?, _ lectureName:String, _ lectureInfo:String, _ tutorImage:String?, _ tutorName:String, _ tutorNickname:String)
    {
        self.lectureImage.kf.setImage(with: URL(string: (lectureImage ?? "")!))
        self.lectureName.text = lectureName
        self.lectureInfo.text = lectureInfo + " 원"
        self.tutorImage.kf.setImage(with: URL(string: (tutorImage ?? "")))
        self.tutorName.text = tutorName
        self.tutorNickname.text = tutorNickname
    }
 
    
}

