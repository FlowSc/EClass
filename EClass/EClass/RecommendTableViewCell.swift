//
//  RecommendTableViewCell.swift
//  TeamProject6
//
//  Created by Kang Seongchan on 2017. 8. 1..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class RecommendTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

   }

extension RecommendTableViewCell:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCell", for: indexPath) as! RecommendCollectionViewCell
        
//        let myData = lectureList?[indexPath.item] 이건 나중에 데이터 받으면 각각 쏴주는걸로..
        
        cell.lectureName.text = "스타 ㄲ"
        cell.lectureInfo.text = "3만원"
        cell.lectureImage.image = #imageLiteral(resourceName: "five.jpg")
        cell.tutorImage.image = #imageLiteral(resourceName: "five.jpg")
        cell.tutorName.text = "나나"
        cell.tutorNickname.text = "한량"
        cell.tutorImage.layer.cornerRadius = (cell.tutorImage.image?.size.width)! / 2
        cell.tutorImage.backgroundColor = .red
        cell.tutorImage.layer.borderWidth = 1
        cell.backgroundColor = .red

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellsAcross: CGFloat = 1
//        var widthRemainingForCellContent = collectionView.bounds.width
//        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
//            let borderSize: CGFloat = flowLayout.sectionInset.left + flowLayout.sectionInset.right
//            widthRemainingForCellContent -= borderSize + (flowLayout.minimumInteritemSpacing)
//        }
//        let cellWidth = widthRemainingForCellContent / cellsAcross
//        return CGSize(width: cellWidth, height: (cellWidth / 2))
//    }
    
}
