//
//  DetailTableViewController.swift
//  TeamProject6
//
//  Created by Kang Seongchan on 2017. 8. 4..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import MapKit

class DetailTableViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!

    var myData = LectureGenerator.getLecture()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView.estimatedRowHeight = 100
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.reloadData()
        myTableView.register(UINib.init(nibName: "TutorDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "tutorDetailInfoCell")
        myTableView.register(UINib.init(nibName: "LectureIntroTableViewCell", bundle: nil), forCellReuseIdentifier: "LectureIntroTableViewCell")
        myTableView.register(UINib.init(nibName: "MapLocationTableViewCell", bundle: nil), forCellReuseIdentifier: "MapLocationTableViewCell")
        myTableView.register(UINib.init(nibName: "LectureReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "LectureReviewTableViewCell")

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

extension DetailTableViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainImageCell", for: indexPath) as! SimpleImageTableViewCell
            
            cell.settingMyImage(#imageLiteral(resourceName: "pac-man-logo.gif"))
            
            return cell
            
        }else if indexPath.row == 1{
        let cell = tableView.dequeueReusableCell(withIdentifier: "IntroductionCell", for: indexPath) as! IntroductionTableViewCell
            
            cell.setLectureInfo("팩맨", "5.0", "서울 강서구 공항오피스텔", "4명", "50000원", "주 2회", "총 8회 16시간")
        
            return cell}
        
        else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "tutorInfoCell", for: indexPath) as! TutorInfoTableViewCell
            
            cell.setTutor(#imageLiteral(resourceName: "pac-man-logo.gif"), "성찬", tutorComment: "하이하이 \n 이거 많이 쓰면 늘어나는거 팩트입니까? 항ㄴ훈이훈이후니우히나위 저는 IOS 개발자인데 팩맨 겁나 잘하구여 그 똥망한 영화 픽셀도 개즐겁게 본 진성 너드입니다")
            
            
            return cell
        
        }else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "tutorDetailInfoCell", for: indexPath) as! TutorDetailTableViewCell
            
    cell.tutorBasicInfo.text = "인하대학교"
    cell.tutorDetailInfo.text = "jsakdnaksjfbldsakfbsdkfblasdkjfbadsjkbflakjdsfbadsjkfbasjdkfbsjdk\n bfljksdfbasdjkfbadjskfbdkasfbjkdasfblajkdsfbjaldsfbl\n aksdjfbsajldkfbalsjdkfblasdjkfblasdkjfbaslkdfbaljkdsfbald\n sjfblksdjafbaksd\n fblasdkfblaskdjfblaskjdfbalsjdfbasl\n jdfblasdjkfbadlsjkfbladskfbasldjkfblasdjfb\n jadbflj"
            
            return cell
            
        }else if indexPath.row == 4{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LectureIntroTableViewCell", for: indexPath) as! LectureIntroTableViewCell
            
            cell.setValues(myData[indexPath.row - 4])
            
            return cell
        }else if indexPath.row == 5{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MapLocationTableViewCell", for: indexPath) as! MapLocationTableViewCell
            
            
            return cell
        }else if indexPath.row == 6{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LectureReviewTableViewCell", for: indexPath) as! LectureReviewTableViewCell
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4{
            
            let longD = myData[indexPath.row - 4]
            let detailShown = myData[indexPath.row - 4].detailShown
            longD.detailShown = !detailShown
            
            myTableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            
            print("A")

        }
        
        print(indexPath)
        
    }
//    
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        if section == 0 {
//            
//            let collectionView = UICollectionView()
//            let layout = UICollectionViewFlowLayout()
//            layout.scrollDirection = .horizontal
//            layout.estimatedItemSize = CGSize(width: 414, height: 180)
//            
//            view.addSubview(collectionView)
//        }
//    }
    
}
//
//extension DetailTableViewController:UICollectionViewDelegate, UICollectionViewDataSource {
//    
//}

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
