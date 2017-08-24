//
//  DetailTableViewController.swift
//  TeamProject6
//
//  Created by Kang Seongchan on 2017. 8. 4..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import MapKit
import SwiftyJSON
import Alamofire
import SwiftyStarRatingView

class DetailTableViewController: UIViewController {
    
    
    var isWished:Bool = false
    
    @IBAction func wishList(_ sender: UIBarButtonItem) {
        
    }
    
    
    func checkWish(){
        
        Alamofire.upload(multipartFormData: { (data) in
            data.append(self.detailData["id"].stringValue.data(using: .utf8)!, withName: "lecture_id")
        }, usingThreshold: UInt64.init(), to: "http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/regiclass/class/likeclass/", method: .post, headers: ["Authorization":"Token \(UserDefaults.standard.string(forKey: "UserToken")!)"]) { (result) in
            print(result)
            
            if self.isWished == false{
            self.isWished = true
            }else{
                self.isWished = false
            }
            let ac = UIAlertController.init(title: "찜하기가 완료되었습니다", message: "나의 위리스트에서 확인해보세요", preferredStyle: .alert)
            let action = UIAlertAction.init(title: "확인", style: .default, handler: nil)
            ac.addAction(action)
            self.present(ac, animated: true, completion: nil)
            
        }

    }
    
    var averageReviewtotalScore:Double?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    //    @IBAction func askTutorButtonTouched(_ sender: UIButton) {
    //
    //        let alert = UIAlertController.init(title: "튜터에게 문의하기", message: (, preferredStyle: <#T##UIAlertControllerStyle#>)
    //    }
    @IBOutlet weak var myTableView: UITableView!
    var detailData:JSON!
    var userData:JSON!
    var reloadDetailData:JSON!
    var reviewAverage:Double!
    @IBOutlet weak var lectureRegistBt: UIButton!
    var myData:[LectureInfo]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightBtNotSelected:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.bookmarks, target: self, action: #selector(checkWish))
        
        
        
        let rightBtSelected:UIBarButtonItem =  UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(checkWish))


        
        
        reloadList()
        
        if isWished == false {
            self.navigationItem.rightBarButtonItem = rightBtNotSelected
            
        }else{
            self.navigationItem.rightBarButtonItem = rightBtSelected
        }
        
        
        
        
        myData = LectureGenerator.getLecture(detailData["class_intro"].stringValue, detailData["class_intro"].stringValue)
        
        
        reviewAverage = makeReviewAverageScore()
        loadDetailData(detailData["id"].intValue)
        
        
        myTableView.reloadData()
        
        print("Lecture ID")
        
        
        print("AAAA")
        
        
        
        
        self.navigationItem.title = "강의정보"
        myTableView.estimatedRowHeight = 100
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.reloadData()
        myTableView.register(UINib.init(nibName: NibFile.tutorDetail, bundle: nil), forCellReuseIdentifier: CustomsTableViewCell.tutorDetail)
        myTableView.register(UINib.init(nibName: NibFile.lectureIntro, bundle: nil), forCellReuseIdentifier: CustomsTableViewCell.lectureIntro)
        myTableView.register(UINib.init(nibName: NibFile.mapLocation, bundle: nil), forCellReuseIdentifier: CustomsTableViewCell.mapLocation)
        myTableView.register(UINib.init(nibName: NibFile.lectureReivew, bundle: nil), forCellReuseIdentifier: CustomsTableViewCell.lectureReview)
        print("Detail Data Start!!")
        print(detailData)
        print("Detail Data End!!!!!!")
        lectureRegistBt.backgroundColor = UIColor(red: 255/255, green: 125/255, blue: 83/255, alpha: 1)
        
        // Do any additional setup after loading the view.
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension DetailTableViewController:UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var attendanceCount = detailData["total_count"].stringValue
        
        if attendanceCount == "" {
            attendanceCount = "0"
        }
        
        
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomsTableViewCell.lectureBasicInfo, for: indexPath) as! IntroductionTableViewCell
            
            
            
            cell.setLectureInfo(self.detailData["title"].stringValue, self.detailData["locations"][0]["location2"].stringValue, "\(self.detailData["max_member"].stringValue) 명", "회 당 \(self.detailData["price"].stringValue) 원", "주 \(self.detailData["basic_class_time"]) 회", "" , "\(attendanceCount) 명 참여중")
            cell.selectionStyle = .none
            cell.attendanceCount.layer.cornerRadius = 10
            cell.attendanceCount.textColor = .white
            cell.attendanceCount.setBasicColor()
            
            print(averageReviewtotalScore ?? 0 / 5)
            
            return cell}
            
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomsTableViewCell.tutorBasicInfo, for: indexPath) as! TutorInfoTableViewCell
            
            cell.setTutor(#imageLiteral(resourceName: "default-user-image"), detailData["tutor_info"]["nickname"].stringValue, tutorComment: detailData["target_intro"].stringValue)
            cell.selectionStyle = .none
            
            
            return cell
            
        }
        else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomsTableViewCell.tutorDetail, for: indexPath) as! TutorDetailTableViewCell
            
            cell.tutorDetailInfo.text = detailData["tutor_intro"].stringValue
            
            cell.selectionStyle = .none
            
            return cell
            
        }else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomsTableViewCell.lectureIntro, for: indexPath) as! LectureIntroTableViewCell
            cell.selectionStyle = .none
            
            cell.setValues(myData[indexPath.row - 3])
            
            return cell
        }else if indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomsTableViewCell.mapLocation, for: indexPath) as! MapLocationTableViewCell
            
            let cellData = detailData["locations"][0]
            
            cell.additionalCgLb.text = detailData["locations"][0]["location_etc_text"].stringValue + " 원"
            cell.locationLb.text = detailData["locations"][0]["location_detail"].stringValue
            cell.tutorComment.text = detailData["notice"].stringValue
            cell.timeLb.text = detailData["locations"][0]["class_time"].stringValue + "시"
            
            if cellData["class_weekday"].stringValue == "sun" {
                cell.dayIndicateBt.setTitle("일", for: .normal)
            }
            cell.dayIndicateBt.makeCornerRound3()
            cell.dayIndicateBt.backgroundColor = UIColor(red: 255/255, green: 125/255, blue: 83/255, alpha: 1)
            cell.dayIndicateBt.setTitleColor(.white, for: .normal)
            
            
            
            cell.selectionStyle = .none
            
            return cell
        }else if indexPath.row == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomsTableViewCell.lectureReview, for: indexPath) as! LectureReviewTableViewCell
            
            let representativeReviewData = detailData["reviews"][0]
            
            print(representativeReviewData)
            cell.selectionStyle = .none
            
            
            if detailData["review_count"].intValue == 0 {
                cell.firstReviewButton.isHidden = false
                cell.firstReviewRequestLb.isHidden = false
                
                cell.firstReviewRequestLb.text = "아직 등록된 리뷰가 없습니다. \n 첫번째 리뷰의 주인공이 되어보세요! \n \n \n 리뷰 등록하러 가기"
                cell.firstReviewRequestLb.textColor = .white
                
                cell.firstReviewButton.backgroundColor =  UIColor(red: 255/255, green: 125/255, blue: 83/255, alpha: 1)
                
                cell.firstReviewButton.addTarget(self, action: #selector(moveToReviewAddView), for: .touchUpInside)
                cell.noReview()
                
            }else{
                
                cell.moveToreviewButton.addTarget(self, action: #selector(moveToReviewTableView), for: .touchUpInside)
                cell.moveReviewAddB.addTarget(self, action: #selector(moveToReviewAddView), for: .touchUpInside)
                cell.moveToreviewButton.backgroundColor = .lightGray
                cell.moveToreviewButton.setTitleColor(.white, for: .normal)
                cell.moveReviewAddB.setBasicColor()
                cell.moveReviewAddB.makeCornerRound3()
                cell.moveToreviewButton.makeCornerRound3()
                
                cell.reviewContents.text = representativeReviewData["content"].stringValue
                cell.countLb.text = "총 \(detailData["review_count"].intValue) 개"
                cell.reviewScoreLb.text = " " + String(reviewAverage)
                cell.reviewerName.text = representativeReviewData["author"]["nickname"].stringValue
                var date = representativeReviewData["modify_date"].stringValue
                
                date.characters.removeLast(16)
                
                cell.reviewCreateDate.text = date
                cell.reviewStar.isEnabled = false
                cell.reviewStar.value = CGFloat(reviewAverage)
                
                
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func moveToReviewAddView(){
        
        let storybd = UIStoryboard(name: StoryBoardConstant.detailPage, bundle: nil)
        
        let addVc = storybd.instantiateViewController(withIdentifier: "ReviewAddViewController") as! ReviewAddViewController
        
        addVc.classData = detailData
        addVc.loginUserData = userData
        
        self.navigationController?.pushViewController(addVc, animated: true)
    }
    
    func moveToReviewTableView(){
        
        
        let storybd = UIStoryboard(name: StoryBoardConstant.detailPage, bundle: nil)
        
        let reviewVc = storybd.instantiateViewController(withIdentifier: "ReviewShowTableViewController") as! ReviewShowTableViewController
        
        reviewVc.detailData = detailData
        
        self.navigationController?.pushViewController(reviewVc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3{
            
            let longD = myData[indexPath.row - 3]
            let detailShown = myData[indexPath.row - 3].detailShown
            longD.detailShown = !detailShown
            
            myTableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            
        }
        
        print(indexPath)
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        if section == 0 {
            
            let layout = UICollectionViewFlowLayout()
            
            let headerView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width), collectionViewLayout: layout)
            
            layout.scrollDirection = .horizontal
            layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
            layout.itemSize = CGSize.init(width: 414, height: 200)
            headerView.isPagingEnabled = true
            headerView.register(UINib.init(nibName: NibFile.lectureImage, bundle: nil), forCellWithReuseIdentifier: CustomCollectionViewCell.lectureImage)
            
            
            headerView.delegate = self
            headerView.dataSource = self
            
            return headerView}
        
        return UIView()
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailData["lecture_photos"].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.lectureImage, for: indexPath) as! LectureImageCollectionViewCell
        let myImagesUrl:URL = URL(string: detailData["lecture_photos"][indexPath.item]["lecture_photo"].stringValue)!
        
        cell.lectureImage.kf.setImage(with: myImagesUrl)
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LectureRegisterSegue" {
            
            let mv = segue.destination as! LetureRegistViewController
            
            mv.detailData = detailData
        }
    }
    
    func loadDetailData(_ lectureId:Int) {
        
        Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/regiclass/class/detail/", method: .post, parameters: ["lecture_id":lectureId], encoding: JSONEncoding.prettyPrinted, headers: ["Content-type":"application/json"]).responseJSON { (aa) in
            
            
            self.detailData = JSON(aa.result.value)
            self.myTableView.reloadData()
            
        }
        
    }
    
    func makeReviewAverageScore() -> Double {
        
        var myScore:Double = 0.0
        
        
        for (key, value) in detailData["review_average"].dictionaryValue {
            
            print(key, value)
            
            
            let averagePoint = value.doubleValue
            
            myScore += averagePoint
            
            
            
        }
        
        return myScore.roundToPlaces(places: 0) / 5
        
    }
}

class LectureInfo {
    
    var shortDescription:String?
    var longDescription:String?
    var detailShown = false
    
    init(shortDescription:String, longDescription:String) {
        self.shortDescription = shortDescription
        self.longDescription = longDescription
    }
}

class LectureGenerator {
    
    
    var detailData:JSON!
    
    static func getLecture(_ short:String, _ long:String) -> [LectureInfo] {
        
        var allLecture = [LectureInfo]()
        
        allLecture.append(LectureInfo(shortDescription: short, longDescription: long))
        
        return allLecture
    }
}
