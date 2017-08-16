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
        
    }
    
}

extension RecommendTableViewCell {

    
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
    
    
}




