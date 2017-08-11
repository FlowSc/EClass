//
//  MainImageTableViewCell.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 9..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class MainImageTableViewCell: UITableViewCell {
    
    let myImage:[UIImage] = [#imageLiteral(resourceName: "1.png"), #imageLiteral(resourceName: "1.png"), #imageLiteral(resourceName: "0.png"), #imageLiteral(resourceName: "pac-man-logo.gif")]

    @IBOutlet weak var myCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        myCollectionView.register(UINib.init(nibName: "MainImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainImageCollectionViewCell")
        
        
        if let flowLayout = myCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = .init(width: 1, height: 1)
        }
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension MainImageTableViewCell:UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainImageCollectionViewCell", for: indexPath) as! MainImageCollectionViewCell
        
        cell.mainImageview.image = myImage[indexPath.item]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myImage.count
    }

    
}
