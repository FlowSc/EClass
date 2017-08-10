//
//  DetailTableViewController.swift
//  TeamProject6
//
//  Created by Kang Seongchan on 2017. 8. 4..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class DetailTableViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView.estimatedRowHeight = 100
        myTableView.rowHeight = UITableViewAutomaticDimension
        myTableView.allowsSelection = false
        myTableView.reloadData()
        myTableView.register(UINib.init(nibName: "TutorDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "tutorDetailInfoCell")
        myTableView.register(UINib.init(nibName: "LectureIntroTableViewCell", bundle: nil), forCellReuseIdentifier: "LectureIntroTableViewCell")
        
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
        return 5
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
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "LectureIntroTableViewCell", for: indexPath) as! LectureIntroTableViewCell
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 4{
            
            myTableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)

        }
    }
}
