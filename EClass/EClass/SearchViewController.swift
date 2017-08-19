//
//  SearchViewController.swift
//  TeamProject6
//
//  Created by Kang Seongchan on 2017. 8. 1..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var categorySelectButton:UIButton!
    @IBOutlet weak var locationSelectButton:UIButton!
    
    @IBAction func categorySelectButtonTouched(_ sender: Any) {
        print("Category")
        
    }
    
    @IBAction func locationSelectButtonTouched(_ sender: Any) {
        print("Location")
    }
    
    var changedTitleforCategory:String!
    var changedTitleforLocation:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categorySelectButton.layer.borderWidth = 1
        locationSelectButton.layer.borderWidth = 1
        
        NotificationCenter.default.addObserver(forName:  NSNotification.Name.init(rawValue: "CategoryName"), object: nil, queue: nil) { (noti) in
            
            self.changedTitleforCategory = noti.userInfo?["categoryName"]! as! String
            self.categorySelectButton.setTitle(self.changedTitleforCategory, for: .normal)

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
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCell", for: indexPath) as! RecommendCollectionViewCell
        

        cell.lectureName.text = "스타 ㄲ"
        cell.lectureInfo.text = "3만원"
        cell.lectureImage.image = #imageLiteral(resourceName: "five.jpg")
        cell.tutorImage.image = #imageLiteral(resourceName: "default-user-image")
        cell.tutorName.text = "나나"
        cell.tutorImage.layer.cornerRadius = 25
        cell.tutorImage.clipsToBounds = true
        cell.layer.borderWidth = 1
        cell.tutorNickname.text = "한량"

        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellsAcross: CGFloat = 1
        var widthRemainingForCellContent = collectionView.bounds.width
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            let borderSize: CGFloat = flowLayout.sectionInset.left + flowLayout.sectionInset.right
            widthRemainingForCellContent -= borderSize + ((cellsAcross - 1) * flowLayout.minimumInteritemSpacing)
        }
        let cellWidth = widthRemainingForCellContent / cellsAcross
        return CGSize(width: cellWidth, height: (cellWidth / 2))
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
