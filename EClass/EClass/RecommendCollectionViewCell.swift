//
//  RecommendCollectionViewCell.swift
//  TeamProject6
//
//  Created by Kang Seongchan on 2017. 8. 1..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import Kingfisher
import SwiftyStarRatingView

class RecommendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lectureImage:UIImageView!
    @IBOutlet weak var lectureName:UILabel!
    @IBOutlet weak var lectureInfo:UILabel!
    @IBOutlet weak var tutorImage:UIImageView!
    @IBOutlet weak var tutorName:UILabel!
    @IBOutlet weak var tutorNickname:UILabel!
    @IBOutlet weak var reviewRate: SwiftyStarRatingView!
    @IBOutlet weak var reviewPoint: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    func setLecture(_ lectureImage:String?, _ lectureName:String, _ lectureInfo:String, _ tutorImage:String?, _ tutorName:String, _ tutorNickname:String, _ reviewRate:Double, _ reviewPoint:Double, location:String)
    {
        self.lectureImage.kf.setImage(with: URL(string: (lectureImage ?? "")!))
        self.lectureName.text = lectureName
        self.lectureInfo.text = lectureInfo + " 원"
        self.tutorImage.kf.setImage(with: URL(string: (tutorImage ?? "")))
        self.tutorName.text = tutorName
        self.tutorNickname.text = tutorNickname
        self.reviewRate.value = CGFloat(reviewRate)
        self.reviewPoint.text = String(reviewPoint)
        self.locationLabel.text = location
    }
 
    
}

