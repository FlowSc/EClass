//
//  LocationTableViewCell.swift
//  TeamProject6
//
//  Created by Kang Seongchan on 2017. 8. 1..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    var locationStrings:[String] = ["강남", "강동", "강서", "강북", "관악", "광진", "구로", "금천", "노원", "은평"]

    override func awakeFromNib() {
        super.awakeFromNib()
//        collectionView.delegate = self
//        collectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }


}

//
//extension LocationTableViewCell:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return locationStrings.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocationCell", for: indexPath) as! LocationCollectionViewCell
//        
//        cell.locationLabel.text = locationStrings[indexPath.row]
//        cell.layer.borderWidth = 1
//        cell.layer.cornerRadius = 3
//
//        
//        return cell
//        
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        print(locationStrings[indexPath.row])
//       
//    }
//    
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: ((self.window?.bounds.size.width)! - 10), height: 170)
//    }
//}
