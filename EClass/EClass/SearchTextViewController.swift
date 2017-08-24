//
//  SearchTextViewController.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 23..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchTextViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var searchTextButton: UIButton!
    
    var searchList:JSON!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBAction func searchButtonTouched(_ sender: Any) {
        
        Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/regiclass/class/list/", method: .post, parameters: ["search_text":searchWordTf.text!], encoding: JSONEncoding.default, headers: nil).responseJSON { (result) in
            print("-------")
            print(result)
            print(result.result.value)
            print("-------")
            
            self.searchList = JSON(result.result.value)
            
            self.myCollectionView.reloadData()
            self.searchWordTf.resignFirstResponder()
            
        }
        
        
    }
    
    @IBOutlet weak var searchWordTf: UITextField!

    
    override func viewDidLoad() {
        
        reloadList()
        
        self.navigationItem.title = "키워드 검색"
        searchTextButton.setBasicColor()
        
        searchList = []
        super.viewDidLoad()
        
        searchWordTf.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.searchButtonTouched(self)
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RecommendCollectionViewCell
        
        let showData = searchList[indexPath.item]

        var attendanceCount = showData["total_count"].stringValue
        
        if attendanceCount == "" {
            attendanceCount = "0"
        }
        
        cell.tutorImage.layer.cornerRadius = 25
        cell.tutorImage.clipsToBounds = true
        //            cell.tutorImage.layer.borderWidth = 1
        cell.tag = indexPath.item
        //        cell.layer.borderColor = UIColor(red: 255/255, green: 125/255, blue: 83/255, alpha: 1) as! CGColor
        cell.layer.borderWidth = 1

        
        print("CELLDATA 출력 시작!")

        print(showData)
        
        print("CELLDATA 출력 끝!")
        
        cell.setLecture(showData["cover_photo"].stringValue, showData["title"].stringValue, showData["price"].stringValue, showData["cover_photo"].stringValue, "\(attendanceCount) 명 참여 중", showData["tutor_info"]["nickname"].stringValue)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailStb = UIStoryboard.init(name: "DetailPage", bundle: nil)
        
        let mvc = detailStb.instantiateViewController(withIdentifier: "DetailTableViewController") as! DetailTableViewController
        print("START!!")
        mvc.detailData = searchList[indexPath.item]
        
        self.navigationController?.pushViewController(mvc, animated: true)

    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 412, height: 250)
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
