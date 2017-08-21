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
            
            
            self.changedTitleforLocation = noti.userInfo?["LocationName"]! as! String
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCell", for: indexPath) as! RecommendCollectionViewCell
        

        
        let myData = lectureShowList[indexPath.item]
        print("XXXXXXX")
                    print("data 시작점 \(myData)")
        print("~~~~~~~~~~")
        
        cell.setLecture(myData["cover_photo"].stringValue, myData["title"].stringValue, myData["target_intro"].stringValue, myData["cover_photo"].stringValue, myData["tutor"].stringValue, myData["tutor_intro"].stringValue)
        cell.tutorImage.layer.cornerRadius = 25
        cell.tutorImage.clipsToBounds = true
        //            cell.tutorImage.layer.borderWidth = 1
        cell.tag = indexPath.item

        
        
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
