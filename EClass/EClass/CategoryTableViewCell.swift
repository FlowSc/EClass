//
//  CategoryTableViewCell.swift
//  TeamProject6
//
//  Created by Kang Seongchan on 2017. 8. 1..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    var categoryStrings = ["헬스&뷰티", "외국어", "컴퓨터", "음악, 미술", "스포츠", "전공/취업", "이색취미", "전체수업보기"]
    var sectionIndex:Int?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension CategoryTableViewCell:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryStrings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
        
        cell.categoryLabel.text = categoryStrings[indexPath.item]
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 3
        cell.backgroundColor = UIColor.orange
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(categoryStrings[indexPath.row])
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cellsAcross: CGFloat = 2
//        var widthRemainingForCellContent = collectionView.bounds.width
//        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
//            let borderSize: CGFloat = flowLayout.sectionInset.left + flowLayout.sectionInset.right
//            widthRemainingForCellContent -= borderSize + ((cellsAcross - 1) * flowLayout.minimumInteritemSpacing)
//        }
//        let cellWidth = widthRemainingForCellContent / cellsAcross
//        return CGSize(width: cellWidth, height: (cellWidth / 2.5))
//    }


    

    
}
