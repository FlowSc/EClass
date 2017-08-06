//
//  MainTableViewController.swift
//
//
//  Created by Kang Seongchan on 2017. 8. 1..
//
//

import UIKit

class MainTableViewController: UIViewController {
    
    @IBOutlet weak var myMainTableView: UITableView!
    
    var tableViewSectionIndex1:Int?
    var tableViewSectionIndex2:Int?
    var tableViewSectionIndex3:Int?


    
    var locationStrings:[String] = ["강남", "강동", "강서", "강북", "관악", "광진", "구로", "금천", "노원", "AA"]
    var categoryStrings = ["헬스&뷰티", "외국어", "컴퓨터", "음악, 미술", "스포츠", "전공/취업", "이색취미", "전체수업보기"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myMainTableView.reloadData()

        
        
        
        self.automaticallyAdjustsScrollViewInsets = false

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension MainTableViewController:UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //section 0 부분은 타이틀 보여주는 곳이라 cell 이 필요 없어서 0임
        
        self.myMainTableView.rowHeight = UITableViewAutomaticDimension
        self.myMainTableView.estimatedRowHeight = 170

        
        if section == 0 {
            return 0
        }else{
            
            return 1
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableCell", for: indexPath) as! LocationTableViewCell
            tableViewSectionIndex1 = indexPath.section
            return cell

        case 2:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryTableViewCell
            tableViewSectionIndex2 = indexPath.section
            cell2.layer.cornerRadius = 3
            
            return cell2

        case 3:
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "RecommendCell", for: indexPath) as! RecommendTableViewCell
            tableViewSectionIndex3 = indexPath.section
            return cell3

        default:
            return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        if indexPath.section == 1 {
            return 180
        }else if indexPath.section == 2{
            return 370
        }
        
        return 180
    }
    
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        print(UITableViewAutomaticDimension)
//        
//        return UITableViewAutomaticDimension
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        print(UITableViewAutomaticDimension)
//
//        return UITableViewAutomaticDimension
//    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let basicView =  UILabel()
        
        
        if section == 0 {
            let image = UIImageView()

            image.image = #imageLiteral(resourceName: "pac-man-logo.gif")
            
            return image
        }else if section == 1 {
            basicView.text = "지역별 강의 보기"
        }else if section == 2 {
            basicView.text = "카테고리별 강의 보기"
        }else if section == 3 {
            basicView.text = "추천강의"
        }
        
        return basicView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 170
        }else{
            return 20
        }
    }
    


    
    
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        
//              if indexPath.section == 1{
//            if let cell = cell as? LocationTableViewCell {
//                cell.collectionView.dataSource = self
//                cell.collectionView.delegate = self
//            }
//            
//        }
//        else if indexPath.section == 2{
//            if let cell2 = cell as? CategoryTableViewCell {
//                cell2.collectionView.dataSource = self
//                cell2.collectionView.delegate = self
//            }
//            
//            
//        }
//        
//        else{
//            if let cell3 = cell as? RecommendTableViewCell {
//                cell3.collectionView.dataSource = self
//                cell3.collectionView.delegate = self
//            }
//        }
//    }
}
//
//
//extension MainTableViewController:UICollectionViewDataSource, UICollectionViewDelegate {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        
//        
//        if tableViewSectionIndex1 == 1{
//            return locationStrings.count
//        }
//        
//        if tableViewSectionIndex2 == 2 {
//            return categoryStrings.count
//        }
//        if tableViewSectionIndex3 == 3{
//            return 4
//        }else{
//            return 0
//        }
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        if tableViewSectionIndex1 == 1{
//            
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocationCell", for: indexPath) as! LocationCollectionViewCell
//            
//            cell.locationLabel?.text = locationStrings[indexPath.item]
//            cell.layer.borderWidth = 1
//            
//            
//            return cell
//            
//        }
//        if tableViewSectionIndex2 == 2{
//            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
//            
//            cell2.categoryLabel?.text = categoryStrings[indexPath.item]
//            cell2.layer.borderWidth = 1
//            
//            return cell2
//        }
//        if tableViewSectionIndex3 == 3{
//            
//            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCell", for: indexPath) as! RecommendCollectionViewCell
//            
//            //        let myData = lectureList?[indexPath.item] 이건 나중에 데이터 받으면 각각 쏴주는걸로..
//            
//            cell3.lectureName.text = "스타 ㄲ"
//            cell3.lectureInfo.text = "3만원"
//            cell3.lectureImage.image = #imageLiteral(resourceName: "five.jpg")
//            cell3.tutorImage.image = #imageLiteral(resourceName: "five.jpg")
//            cell3.tutorName.text = "나나"
//            cell3.tutorNickname.text = "한량"
//            cell3.tutorImage.layer.cornerRadius = (cell3.tutorImage.image?.size.width)! / 2
//            cell3.tutorImage.backgroundColor = .red
//            cell3.tutorImage.layer.borderWidth = 1
//            cell3.layer.borderWidth = 1
//            
//            
//            return cell3
//        }else{
//            return UICollectionViewCell()
//        }
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.item)
//        print(tableViewSectionIndex1)
//        print(tableViewSectionIndex2)
//        print(tableViewSectionIndex3)
//    }
//}
