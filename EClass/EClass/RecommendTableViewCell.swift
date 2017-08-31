//
//  RecommendTableViewCell.swift
//  TeamProject6
//
//  Created by Kang Seongchan on 2017. 8. 1..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RecommendTableViewCell: UITableViewCell {
    
    var recommendLectureList:JSON!
    var lectureShowList:[JSON]!

    @IBOutlet weak var collectionView:UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        recommendLectureList = LectureList.lectureList
        lectureShowList = recommendLectureList.array
    }
    
}

extension RecommendTableViewCell:UICollectionViewDataSource, UICollectionViewDelegate {
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("AA")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.lectureDetail, for: indexPath) as! RecommendCollectionViewCell
        
        
        let myData = recommendLectureList[indexPath.item]
        
        print(myData)
        
        var attendanceCount = myData["total_count"].stringValue
        
        if attendanceCount == "" {
            attendanceCount = "0"
        }
        
        
        func makeReviewAverageScore() -> Double {
            
            var myScore:Double = 0.0
            
            
            for (key, value) in myData["review_average"].dictionaryValue {
                
                print(key, value)
                
                
                let averagePoint = value.doubleValue
                
                myScore += averagePoint
                
                
                
            }
            
            return myScore.roundToPlaces(places: 0) / 5
            
        }
        
        
        
        
        cell.setLecture(myData["lecture_photos"][0]["lecture_photo"].stringValue, myData["title"].stringValue, myData["price"].stringValue, myData["cover_photo"].stringValue, "\(attendanceCount) 명 참여", myData["tutor_info"]["nickname"].stringValue, makeReviewAverageScore(), makeReviewAverageScore(), location: myData["locations"][0]["location2"].stringValue)
        cell.tutorImage.makeCircle()
        
        
        cell.tag = indexPath.item
        
        
        
    
        
        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 412, height: 250)
    }
}


