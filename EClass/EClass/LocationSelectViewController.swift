//
//  LocationSelectViewController.swift
//  TeamProject6
//
//  Created by Kang Seongchan on 2017. 8. 3..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class LocationSelectViewController: UIViewController {
 var locationStrings:[String] = ["강남", "강동", "강서", "강북", "관악", "광진", "구로", "금천", "노원", "도봉", "동대문", "동작", "마포", "서대문", "서초", "성동", "성북", "송파", "양천", "영등포", "용산", "은평", "종로", "중구", "중랑"]
    override func viewDidLoad() {
        super.viewDidLoad()

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

extension LocationSelectViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationStrings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocationCell", for: indexPath) as! LocationCollectionViewCell
        cell.image.image = UIImage(named: "location" + "\(indexPath.item)")
//        cell.locationLabel.textColor = .white


        cell.locationLabel.text = locationStrings[indexPath.item]
        cell.layer.borderWidth = 1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print(locationStrings[indexPath.item])
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "LocationName"), object: nil, userInfo:["locationName":locationStrings[indexPath.item]])
        
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
