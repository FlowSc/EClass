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

class DetailTableViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    
    var detailData:JSON!
    var userData:JSON!

    @IBOutlet weak var lectureRegistBt: UIButton!
    var myData = LectureGenerator.getLecture()
    var myLectureData:[UIImage] = [#imageLiteral(resourceName: "pac-man-logo.gif"), #imageLiteral(resourceName: "default-user-image"),#imageLiteral(resourceName: "whiteStar")]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = self.detailData["title"].stringValue
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
            
            cell.setLectureInfo(self.detailData["title"].stringValue, "5.0",self.detailData["locations"][0]["location2"].stringValue, "\(self.detailData["max_member"].stringValue) 명", "회 당 \(self.detailData["price"].stringValue) 원", "주 \(self.detailData["basic_class_time"]) 회", "총 8회 16시간", "\(attendanceCount) 명 참여중")
            cell.selectionStyle = .none
            
            cell.attendanceCount.layer.cornerRadius = 10
            cell.attendanceCount.textColor = .white
            cell.attendanceCount.setBasicColor()

        
            return cell}
        
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomsTableViewCell.tutorBasicInfo, for: indexPath) as! TutorInfoTableViewCell
            
            cell.setTutor(#imageLiteral(resourceName: "default-user-image"), detailData["tutor_info"]["nickname"].stringValue, tutorComment: "하이하이 \n 이거 많이 쓰면 늘어나는거 팩트입니까? 항ㄴ훈이훈이후니우히나위 저는 IOS 개발자인데 팩맨 겁나 잘하구여 그 똥망한 영화 픽셀도 개즐겁게 본 진성 너드입니다")
            cell.selectionStyle = .none

            
            return cell
        
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomsTableViewCell.tutorDetail, for: indexPath) as! TutorDetailTableViewCell
            
    cell.tutorBasicInfo.text = "인하대학교"
    cell.tutorDetailInfo.text = "jsakdnaksjfbldsakfbsdkfblasdkjfbadsjkbflakjdsfbadsjkfbasjdkfbsjdk\n bfljksdfbasdjkfbadjskfbdkasfbjkdasfblajkdsfbjaldsfbl\n aksdjfbsajldkfbalsjdkfblasdjkfblasdkjfbaslkdfbaljkdsfbald\n sjfblksdjafbaksd\n fblasdkfblaskdjfblaskjdfbalsjdfbasl\n jdfblasdjkfbadlsjkfbladskfbasldjkfblasdjfb\n jadbflj"
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
                
            cell.reviewContents.text = representativeReviewData["content"].stringValue
            cell.countLb.text = "총 \(detailData["review_count"].intValue) 개"
            cell.reviewScoreLb.text = " " + String(Double(representativeReviewData["curriculum_rate"].intValue))
            cell.reviewerName.text = representativeReviewData["author"]["username"].stringValue
            var date = representativeReviewData["modify_date"].stringValue
                
                date.characters.removeLast(16)
                
            cell.reviewCreateDate.text = date

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
        layout.itemSize = CGSize.init(width: 414, height: 180)
        headerView.isPagingEnabled = true
        headerView.register(UINib.init(nibName: NibFile.lectureImage, bundle: nil), forCellWithReuseIdentifier: CustomCollectionViewCell.lectureImage)
    
        
        headerView.delegate = self
        headerView.dataSource = self
    
            return headerView}
        
        return UIView()
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 180
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(detailData["lecture_photos"].count)
        return detailData["lecture_photos"].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.lectureImage, for: indexPath) as! LectureImageCollectionViewCell
        let myImagesUrl:URL = URL(string: detailData["lecture_photos"][indexPath.item]["lecture_photo"].stringValue)!
        
        print("URLLOG")
        print(myImagesUrl)
        print("AAAAAA")
        print(detailData["lecture_photos"])
        print("BBBBBBB")

        cell.lectureImage.kf.setImage(with: myImagesUrl)
        

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LectureRegisterSegue" {
            
            let mv = segue.destination as! LetureRegistViewController
            
            mv.detailData = detailData
        }
    }
}

class LectureInfo {
    
    var title:String?
    var shortDescription:String?
    var longDescription:String?
    var detailShown = false
    
    init(title:String, shortDescription:String, longDescription:String) {
        self.title = title
        self.shortDescription = shortDescription
        self.longDescription = longDescription
    }
}

class LectureGenerator {
    
    static func getLecture() -> [LectureInfo] {
        
        var allLecture = [LectureInfo]()
        
        allLecture.append(LectureInfo(title: "팩맨", shortDescription: "좋아요!", longDescription: "이젠 괜찮니 너무 힘들었잖아 우리 그 마무리가..... 고작 이별뿐인건데 우린 참 어려웠어... 잘지낸다고 전해들었어 가끔 벌써 참 좋은 사람 만나 잘 지내고있어 굳이 내게 전하더라...잘했어 넌 못참았을거야 그 허전함을 견뎌내기엔 좋으니 사랑해서 사랑을 시작 할 때에 니가 얼마나 예쁜 지 모르지 그 모습을 아직도 못잊어 헤어나오지 못해 니 소식들린 날은 더 좋으니 그 사람 솔직히 견디기 버거워 니가 조금더 힘들면 좋겠어 진짜 조금 내 십분의 일 만이라도 아프다.................행복해줘"))
        
        return allLecture
    }
}
