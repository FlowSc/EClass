//
//  SearchViewController.swift
//  TeamProject6
//
//  Created by Kang Seongchan on 2017. 8. 1..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import SwiftyJSON

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var changedTitleforCategory:String!
    var changedTitleforLocation:String!
    var recommendLectureList:JSON!
    var lectureShowList:[JSON]!
    @IBOutlet weak var categorySelectButton:UIButton!
    @IBOutlet weak var locationSelectButton:UIButton!
    @IBOutlet weak var myCollectionView:UICollectionView!
    
    @IBAction func categorySelectButtonTouched(_ sender: Any) {
        let firstShowList = recommendLectureList.array

        self.lectureShowList = firstShowList
        
    }
    
    @IBAction func locationSelectButtonTouched(_ sender: Any) {
        let firstShowList = recommendLectureList.array

        self.lectureShowList = firstShowList
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        recommendLectureList = LectureList.lectureList
        
        categorySelectButton.setBasicColor()
        locationSelectButton.setBasicColor()
        

        categorySelectButton.layer.borderWidth = 1
        locationSelectButton.layer.borderWidth = 1
        
        self.categorySelectButton.setTitle(self.changedTitleforCategory, for: .normal)
        self.locationSelectButton.setTitle(self.changedTitleforLocation, for: .normal)
        
        NotificationCenter.default.addObserver(forName:  NSNotification.Name.init(rawValue: "LocationName"), object: nil, queue: nil) { noti in
            
            self.lectureShowList = self.recommendLectureList.array
            self.changedTitleforLocation = noti.userInfo?["locationName"]! as! String
            self.locationSelectButton.setTitle(self.changedTitleforLocation, for: .normal)
            
            print(self.changedTitleforLocation)
            

            
            if self.changedTitleforLocation == "관악"{
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("관악")
                })
                
                self.lectureShowList = filterList
                
            }else if self.changedTitleforLocation == "강동" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("강동")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "강북" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("강북")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "강서" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("강서")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "강남" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("강남")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "광진" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("광진")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "구로" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("구로")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "금천" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("금천")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "노원" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("노원")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "도봉" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("도봉")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "동대문" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("동대문")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "동작" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("마포")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "마포" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("마포")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "서대문" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("서대문")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "서초" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("서초")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "성동" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("성동")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "성북" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("성북")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "송파" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("송파")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "양천" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("양천")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "영등포" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("영등포")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "용산" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("용산")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "은평" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("은평")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "종로" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("종로")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "중구" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("중구")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "중랑" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue.contains("중랑")
                })
                
                self.lectureShowList = filterList
            }else if self.changedTitleforLocation == "관악" {
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["locations"][0]["location2"].stringValue == "관악"
                })
                
                self.lectureShowList = filterList
            }else{
                
                let filterList:[JSON] = self.lectureShowList
                
                self.lectureShowList = filterList
                
            }
            self.myCollectionView.reloadData()



        }
        
        NotificationCenter.default.addObserver(forName:  NSNotification.Name.init(rawValue: "CategoryName"), object: nil, queue: nil) { (noti) in
            
    
            self.lectureShowList = self.recommendLectureList.array
            
            self.changedTitleforCategory = noti.userInfo?["categoryName"]! as! String
            self.categorySelectButton.setTitle(self.changedTitleforCategory, for: .normal)
            
            
            if self.changedTitleforCategory == "이색취미" {
      
            let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                myData["category"].stringValue == "hobby"
            })

            self.lectureShowList = filterList
            
            }
            
            if self.changedTitleforCategory == "헬스&뷰티" {
                
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["category"].stringValue == "hbn"
                })
                
                self.lectureShowList = filterList

            }
            
            if self.changedTitleforCategory == "외국어" {
                
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["category"].stringValue == "lang"
                })
                
                self.lectureShowList = filterList
                
            }
            
            if self.changedTitleforCategory == "컴퓨터" {
                
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["category"].stringValue == "com"
                })
                
                self.lectureShowList = filterList
                
            }
            
            
            if self.changedTitleforCategory == "음악/미술" {
                
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["category"].stringValue == "mna"
                })
                
                self.lectureShowList = filterList
                
            }
            
            
            if self.changedTitleforCategory == "스포츠" {
                
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["category"].stringValue == "sports"
                })
                
                self.lectureShowList = filterList
                
            }
            
            
            if self.changedTitleforCategory == "진로/취업" {
                
                let filterList:[JSON] = self.lectureShowList.filter({ (myData) -> Bool in
                    myData["category"].stringValue == "major"
                })
                
                self.lectureShowList = filterList
                
            }
            
            
            if self.changedTitleforCategory == "전체수업보기" {
                
                let filterList:[JSON] = self.lectureShowList
                
                self.lectureShowList = filterList
                
            }

            self.myCollectionView.reloadData()
            
            print(self.changedTitleforCategory)
        }
        
        
        NotificationCenter.default.addObserver(forName:  NSNotification.Name.init(rawValue: "LocationName"), object: nil, queue: nil) { (noti) in
            
            
            self.changedTitleforLocation = noti.userInfo?["locationName"]! as! String
            self.locationSelectButton.setTitle(self.changedTitleforLocation, for: .normal)
            
            
            print(self.changedTitleforCategory)
        }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lectureShowList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCollectionViewCell", for: indexPath) as! RecommendCollectionViewCell
        
        let myData = lectureShowList[indexPath.item]

        
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
        
        
        print("XXXXXXX")
                    print("data 시작점 \(myData)")
        print("~~~~~~~~~~")
        
        cell.setLecture(myData["lecture_photos"][0]["lecture_photo"].stringValue, myData["title"].stringValue, myData["price"].stringValue, myData["cover_photo"].stringValue, "\(attendanceCount) 명 참여", myData["tutor_info"]["nickname"].stringValue, makeReviewAverageScore(), makeReviewAverageScore(), location: myData["locations"][0]["location2"].stringValue)
        cell.tutorImage.layer.cornerRadius = 25
        cell.tutorImage.clipsToBounds = true
        cell.tag = indexPath.item
        cell.layer.borderWidth = 1


        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailStb = UIStoryboard.init(name: "DetailPage", bundle: nil)
        
        let mvc = detailStb.instantiateViewController(withIdentifier: "DetailTableViewController") as! DetailTableViewController
        print("START!!")
        mvc.detailData = lectureShowList[indexPath.item]
        
        self.navigationController?.pushViewController(mvc, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                return CGSize(width: 412, height: 250)
    }
}
