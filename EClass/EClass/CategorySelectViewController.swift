//
//  CategorySelectViewController.swift
//  TeamProject6
//
//  Created by Kang Seongchan on 2017. 8. 2..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class CategorySelectViewController: UIViewController {
    
    var categoryStrings = ["헬스&뷰티", "외국어", "컴퓨터", "음악, 미술", "스포츠", "전공/취업", "이색취미", "전체수업보기"]


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "카테고리"
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension CategorySelectViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryStrings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
//        cell.image.image = UIImage(named: "category" + "\(indexPath.item)")

        cell.categoryLabel.text = categoryStrings[indexPath.item]
//        cell.categoryLabel.textColor = .white
        cell.layer.borderWidth = 1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(categoryStrings[indexPath.item])
       NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "CategoryName"), object: nil, userInfo:["categoryName":categoryStrings[indexPath.item]])
        
        
        
        self.navigationController?.popViewController(animated: true)
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

    
}
