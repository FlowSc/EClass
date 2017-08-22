//
//  MainTableViewControlSWRevealViewControllerSegueSetControllerler.swift
//
//
//  Created by Kang Seongchan on 2017. 8. 1..
//
//

import UIKit
import  Alamofire
import SwiftyJSON

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
    
    
    var categoryStrings = ["헬스&뷰티", "외국어", "컴퓨터", "음악/미술", "스포츠", "진로/취업", "이색취미", "전체수업보기"]
    var tableViewIndex:Int?
    var recommendLectureList:JSON!
    var lectureShowList:[JSON]!
    var currentUserToken:String!
    var currentUserName:String!
    var currentUserPK:Int!
    var currentUserNickname:String?
    
    
    
    var userData:JSON!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myMainTableView.reloadData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenus()
        customizeNavBar()
        self.myMainTableView.reloadData()
        
        currentUserToken = UserDefaults.standard.string(forKey: "UserToken")
        currentUserPK = UserDefaults.standard.integer(forKey: "UserPK")
        currentUserName = UserDefaults.standard.string(forKey: "UserName")
        currentUserNickname = UserDefaults.standard.string(forKey: "UserNickname") ?? "Default"
        
        
        
        print(currentUserNickname)
        print(currentUserToken)
        
        
        
        //        self.myMainTableView.register(UINib.init(nibName: "LectureTableViewCell"
        //            , bundle: nil), forCellReuseIdentifier: "LectureCell")
        
        print("USERTOKEN!!!!!!")
        
        
        
        
        print("##########")
        
        myMainTableView.allowsSelection = false
        
        recommendLectureList = LectureList.lectureList
        lectureShowList = recommendLectureList.array
        
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
        
        print(indexPath.row, indexPath.section)
        
        
        switch indexPath.section {
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomsTableViewCell.location, for: indexPath) as! LocationTableViewCell
            tableViewIndex = indexPath.section
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomsTableViewCell.category, for: indexPath) as! CategoryTableViewCell
            cell.makeCornerRound3()
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            
            tableViewIndex = indexPath.section
            
            
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomsTableViewCell.lectureDetail, for: indexPath) as! RecommendTableViewCell
            
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
            tableViewIndex = indexPath.section
            
            
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
            return 7
        default:
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch tableViewIndex!{
            
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.location, for: indexPath) as! LocationCollectionViewCell
            
            
            cell.image.image = UIImage(named: "location" + "\(indexPath.item)")
            
            cell.locationLabel.text = locationStrings[indexPath.row]
            cell.makeCornerRound3()
            cell.tag = indexPath.item

            return cell
            
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.category, for: indexPath) as! CategoryCollectionViewCell
            
            cell.categoryLabel.text = categoryStrings[indexPath.item]
            
            cell.image.image = UIImage(named: "category" + "\(indexPath.item)")
            
            cell.makeCornerRound3()
            cell.tag = indexPath.item
            cell.backgroundColor = UIColor.white
            
            
            return cell
            
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.lectureDetail, for: indexPath) as! RecommendCollectionViewCell
            
            
            let myData = recommendLectureList[indexPath.item]
            
            print(myData)
            
            
            cell.setLecture(myData["lecture_photos"][0]["lecture_photo"].stringValue, myData["title"].stringValue, myData["price"].stringValue, myData["cover_photo"].stringValue, myData["target_intro"].stringValue, myData["tutor_info"]["nickname"].stringValue)
            cell.tutorImage.makeCircle()
            
            
            cell.tag = indexPath.item
            
            
            return cell
        default:
            return UICollectionViewCell()
            
        }
        
        
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
            basicView.text = "최근 등록된 강의"
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        
        if segue.identifier == SegueIdentifier.detailSegue {
            
            if let cell = sender as? RecommendCollectionViewCell {
                
                let indexPath = cell.tag
                let destination = segue.destination as! DetailTableViewController
                
                destination.detailData = lectureShowList[indexPath]
                destination.userData = userData
                
                print(indexPath)
            }
        }
        else if segue.identifier == SegueIdentifier.categoryFilterSegue {
            
            if let cell = sender as? CategoryCollectionViewCell {
                
                let indexPath = cell.tag
                
                
                let destination = segue.destination as! SearchViewController
                
                print(categoryStrings[indexPath])
                destination.changedTitleforCategory = categoryStrings[indexPath]
                destination.changedTitleforLocation = "전체선택"
                
                if categoryStrings[indexPath] == "이색취미" {
                    
                    let filterList:[JSON] = lectureShowList.filter({ (myData) -> Bool in
                        myData["category"].stringValue == "hobby"
                    })
                    
                    destination.lectureShowList = filterList
                }
                
                if categoryStrings[indexPath] == "헬스&뷰티" {
                    
                    let filterList:[JSON] = lectureShowList.filter({ (myData) -> Bool in
                        myData["category"].stringValue == "hbn"
                    })
                    print(filterList)
                    
                    destination.lectureShowList = filterList
                }
                
                if categoryStrings[indexPath] == "외국어" {
                    
                    let filterList:[JSON] = lectureShowList.filter({ (myData) -> Bool in
                        myData["category"].stringValue == "lang"
                    })
                    
                    destination.lectureShowList = filterList
                }
                
                
                if categoryStrings[indexPath] == "컴퓨터" {
                    
                    let filterList:[JSON] = lectureShowList.filter({ (myData) -> Bool in
                        myData["category"].stringValue == "com"
                    })
                    
                    destination.lectureShowList = filterList
                }
                
                
                if categoryStrings[indexPath] == "음악/미술" {
                    
                    let filterList:[JSON] = lectureShowList.filter({ (myData) -> Bool in
                        myData["category"].stringValue == "mna"
                    })
                    
                    destination.lectureShowList = filterList
                }
                
                
                if categoryStrings[indexPath] == "스포츠" {
                    
                    let filterList:[JSON] = lectureShowList.filter({ (myData) -> Bool in
                        myData["category"].stringValue == "sports"
                    })
                    
                    destination.lectureShowList = filterList
                }
                
                
                if categoryStrings[indexPath] == "진로/취업" {
                    
                    let filterList:[JSON] = lectureShowList.filter({ (myData) -> Bool in
                        myData["category"].stringValue == "major"
                    })
                    
                    destination.lectureShowList = filterList
                    print(destination.lectureShowList)
                }
                
                
                if categoryStrings[indexPath] == "전체수업보기" {
                    
                    let filterList:[JSON] = lectureShowList
                    
                    destination.lectureShowList = filterList
                }
                
            }
        }
        else{
            if let cell = sender as? LocationCollectionViewCell {
                
                let indexPath = cell.tag
                
                
                let destination = segue.destination as! SearchViewController
                print(locationStrings[indexPath])
                   destination.changedTitleforCategory = "전체선택"
                destination.changedTitleforLocation = locationStrings[indexPath]

                
                if locationStrings[indexPath] == "관악"             {
                    let filterList:[JSON] = lectureShowList.filter({ (myData) -> Bool in
                        myData["locations"][0]["location2"].stringValue == "관악"
                    })
                    
                    destination.lectureShowList = filterList

                }else{
                
                    let filterList:[JSON] = lectureShowList
                    
                    destination.lectureShowList = filterList
                    
                }
                
            }
            
        }
    }
    
}
