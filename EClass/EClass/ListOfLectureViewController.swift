//
//  ListOfLectureViewController.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 11..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ListOfLectureViewController: UIViewController, UITabBarDelegate, UITableViewDelegate, UITableViewDataSource {


    var selectTabBar:Bool = true
    var myLectureList:JSON = []
    var wishListJson:JSON = []
    
    
    @IBOutlet weak var wishList: UITabBarItem!
    @IBOutlet weak var takeLectureList: UITabBarItem!
    @IBOutlet weak var tabBarOutlet: UITabBar!
    
    func loadMyLecture()->JSON{
        
        var lectureList:JSON = []
        
        Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/class/list/", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization":"Token \(UserDefaults.standard.string(forKey: "UserToken")!)"]).responseJSON { (data) in
            var result = JSON(data.result.value)
            
            let lectureData = result["results"]
                        
            self.myLectureList = lectureData
        
        }
        
        return lectureList
    }
    
    func loadWishList(){
        Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/like/class/list/", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization":"Token \(UserDefaults.standard.string(forKey: "UserToken")!)"]).responseJSON { (data) in
            
            var result = JSON(data.result.value)
            
            let lectureData = result["results"]
            
            self.wishListJson = lectureData
            

        }

        
    }

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        if item == takeLectureList
        {
            selectTabBar = true
        }else
        {
            selectTabBar = false
        }
        tv.reloadData()
    }
    
    @IBOutlet weak var tv: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if selectTabBar {
            return myLectureList.count
        }else{
            return wishListJson.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectTabBar
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListOfLectureTableViewCell
            
            let cellData = myLectureList[indexPath.row]["lecture"]
            
            cell.introduceOfLectureLabel.text = cellData["title"].stringValue
            cell.tutorProfileImage.kf.setImage(with: URL(fileURLWithPath: cellData["tutor"]["my_photo"].stringValue))
            cell.priceOfLectureLabel.text = cellData["tutor"]["nickname"].stringValue
            
            
            
            return cell
        }else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListOfLectureTableViewCell
            
            let cellData = wishListJson[indexPath.row]["lecture"]
            
            cell.introduceOfLectureLabel.text = cellData["title"].stringValue
            cell.tutorProfileImage.kf.setImage(with: URL(fileURLWithPath: cellData["tutor"]["my_photo"].stringValue))
            cell.priceOfLectureLabel.text = cellData["tutor"]["nickname"].stringValue

            return cell
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarOutlet.delegate = self
        loadWishList()
        myLectureList = loadMyLecture()
        print(myLectureList)
        tv.reloadData()
//        tabBarOutlet.selectedItem = takeLectureList

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadWishList()
        loadMyLecture()
        tv.reloadData()
        
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
