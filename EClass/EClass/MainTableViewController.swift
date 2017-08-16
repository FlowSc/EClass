//
//  MainTableViewControlSWRevealViewControllerSegueSetControllerler.swift
//
//
//  Created by Kang Seongchan on 2017. 8. 1..
//
//

import UIKit
let view1 = UIView()

extension SWRevealViewController
{
    
    func addView()
    {
        let storyBoard = UIStoryboard(name: "MainPage", bundle: nil)
        let rearViewController = storyBoard.instantiateViewController(withIdentifier: "RearUserInfoViewController") as! RearUserInfoViewController
        self.rearViewController = rearViewController
        
        self.revealToggle(animated: true)
        
        view1.isUserInteractionEnabled = true
        view1.backgroundColor = UIColor(white: 0, alpha: 0.5)
        view1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissFunc(_:))))
        self.view.addSubview(view1)
        view1.frame = CGRect(x: self.rearViewRevealWidth, y: 0, width: self.view.frame.size.width - self.rearViewRevealWidth, height: self.view.frame.size.height)
        view1.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            view1.alpha = 0.5
        })
        
    }
    func dismissFunc(_ sender:UITapGestureRecognizer)
    {
        //        print("dismiss")
        self.revealToggle(animated: true)
        
        
        UIView.animate(withDuration: 0.5, animations: {
            print("dismiss")
        }) { (bool) in
            
            view1.removeFromSuperview()
            
        }
        
    }
}

class MainTableViewController: UIViewController {
    
    @IBOutlet weak var myMainTableView: UITableView!
    var locationStrings:[String] = ["강남", "강동", "강서", "강북", "관악", "광진", "구로", "금천", "노원"]

    var categoryStrings = ["헬스&뷰티", "외국어", "컴퓨터", "음악, 미술", "스포츠", "전공/취업", "이색취미", "전체수업보기"]
    var tableViewIndex:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenus()
        customizeNavBar()
        self.myMainTableView.reloadData()
        self.myMainTableView.register(UINib.init(nibName: "LectureTableViewCell"
            , bundle: nil), forCellReuseIdentifier: "LectureCell")
    
        myMainTableView.allowsSelection = false

        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var userInfoSlideOutlet: UIBarButtonItem!
    func sideMenus()
    {
        if revealViewController() != nil
        {
            userInfoSlideOutlet.target = revealViewController()
            userInfoSlideOutlet.action = #selector(SWRevealViewController.addView)
            
            
            
            revealViewController().rearViewRevealWidth = 300
//            revealViewController().rightViewRevealWidth = 160
            
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    
    func customizeNavBar()
    {
        navigationController?.navigationBar.tintColor = UIColor(colorLiteralRed: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 125/255, blue: 83/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
}

extension MainTableViewController:UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

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
            tableViewIndex = indexPath.section
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
//            cell.collectionView.register(LocationCollectionViewCell.self, forCellWithReuseIdentifier: "LocationCell")
            cell.collectionView.reloadData()
//
            return cell

        case 2:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryTableViewCell
            cell2.layer.cornerRadius = 3
            cell2.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            cell2.collectionView.reloadData()

            tableViewIndex = indexPath.section


            return cell2
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendCell", for: indexPath) as! RecommendTableViewCell
            
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            tableViewIndex = indexPath.section
            cell.collectionView.reloadData()



            
            return cell

        default:
            return UITableViewCell()
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch tableViewIndex! {
        case 1:
            return locationStrings.count
        case 2:
            return categoryStrings.count
        case 3:
            return 4
        default:
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch tableViewIndex!{
        
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocationCell", for: indexPath) as! LocationCollectionViewCell
            
            

            cell.locationLabel.text = locationStrings[indexPath.row]
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 3

            cell.reloadInputViews()
            
            return cell

        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
            
            cell.categoryLabel.text = categoryStrings[indexPath.item]
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 3
            cell.backgroundColor = UIColor.white
            cell.reloadInputViews()

//            myMainTableView.reloadData()

            return cell
        
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCollectionViewCell", for: indexPath) as! RecommendCollectionViewCell
            
            //        let myData = lectureList?[indexPath.item] 이건 나중에 데이터 받으면 각각 쏴주는걸로..
            
//            myMainTableView.reloadData()

            cell.setLecture(#imageLiteral(resourceName: "five.jpg"), "성찬이의 팩맨 특강", "30,000", #imageLiteral(resourceName: "default-user-image"), "성찬", "a.k.a. king of pacman")
            cell.tutorImage.layer.cornerRadius = 25
            cell.tutorImage.layer.borderWidth = 1
            cell.tag = indexPath.item
            cell.reloadInputViews()

            
            return cell
        default:
            return UICollectionViewCell()
            
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let moveCell = collectionView.cellForItem(at: indexPath) as! RecommendCollectionViewCell
//        
//        print(moveCell.tag)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch tableViewIndex!{
        case 1:
            return CGSize(width: 410, height: 200)
        case 2:
            return CGSize.init(width: 190, height: 80)
        default:
            return CGSize(width: 412, height: 250)
        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        if indexPath.section == 1 {
            return 200
        }else if indexPath.section == 2{
            return 370
        }
        
        return 200
    }
    
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
}
