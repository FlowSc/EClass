//
//  FAQViewController.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 13..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

let student = StudentFAQList()
let tutor = TutorFAQList()
var studentSelectRow:[Bool] = [true,true,true,true,true,true,true,true]
var tutorSelectRow:[Bool] = [true,true,true,true,true]

class FAQViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITabBarDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isStudentOrTutor
        {
            return 8
        }else
        {
            return 5
        }

    }
    
    @IBOutlet weak var studentOrTutorTabBar: UITabBar!
    @IBOutlet weak var studentItem: UITabBarItem!
    @IBOutlet weak var tutorItem: UITabBarItem!
    var isStudentOrTutor:Bool = true
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0
        {
            isStudentOrTutor = true
        }else
        {
            isStudentOrTutor = false
        }
        tv.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if isStudentOrTutor
        {
            return student.short[section]
        }else
        {
            return tutor.short[section]
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        tableView.tableHeaderView?.backgroundColor = .red
        tableView.headerView(forSection: section)?.backgroundColor = .red
        return 44
    }

    
    
    @IBOutlet weak var tv: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAQTableViewCell", for: indexPath) as! FAQTableViewCell
        if isStudentOrTutor
        {
            cell.set(student, data2: nil, data3: indexPath.section)
        }else
        {
            cell.set(nil, data2: tutor, data3: indexPath.section)
        }
//        if indexPath.row % 2 == 1
//        {
//            
//            cell.questionLabel.alpha = 0.9
//            cell.questionLabel.textColor = .gray
////            cell.isHidden = true
//            cell.removeFromSuperview()
//            cell.autoresizingMask = UIViewAutoresizing.flexibleHeight
//            
////            cell.questionLabel.font = UIFont.init(name: "system", size: 14)
////            cell.questionLabel.text?
////            tv.separatorColor = .clear
//        }else
//        {
////            tv.separatorColor = .clear
//        }
//        cell.removeFromSuperview()
//        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        tv.estimatedRowHeight = 180
        tv.rowHeight = UITableViewAutomaticDimension
        tv.tableFooterView = UIView(frame: CGRect.zero)
        tv.tableHeaderView?.backgroundColor = .red
        tv.headerView(forSection: indexPath.section)?.backgroundColor = .red
//        cell.autoresizesSubviews
        
        return cell
        
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 180
//    }
    
    
//    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        if isStudentOrTutor
//        {
//            studentSelectRow[indexPath.row] = !studentSelectRow[indexPath.row]
//        }else
//        {
//            tutorSelectRow[indexPath.row] = !tutorSelectRow[indexPath.row]
//        }
//        return indexPath
//        
//        
//    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isStudentOrTutor
        {
            studentSelectRow[indexPath.row] = !studentSelectRow[indexPath.row]
        }else
        {
            tutorSelectRow[indexPath.row] = !tutorSelectRow[indexPath.row]
        }
        
        tv.separatorColor = .clear
        tv.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tv.reloadData()
    }
    
    func reloadCell(_ data:UITapGestureRecognizer)
    {
        let vIndex = tv.indexPathForRow(at: data.location(in: self.view))
        print("1")
        if isStudentOrTutor
        {
            if studentSelectRow[(vIndex?.section)!]
            {
                tv.insertRows(at: [vIndex!], with: UITableViewRowAnimation.automatic)
            }else
            {
                tv.deleteRows(at: [vIndex!], with: UITableViewRowAnimation.automatic)
            }
        }else
        {
            if tutorSelectRow[(vIndex?.section)!]
            {
                tv.insertRows(at: [vIndex!], with: UITableViewRowAnimation.automatic)
            }else
            {
                tv.deleteRows(at: [vIndex!], with: UITableViewRowAnimation.automatic)
            }
        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(reloadCell(_:)))
        tv.tableHeaderView?.addGestureRecognizer(tapGesture)
//        tv.tableHeaderView?.backgroundColor = .white
        
        
        studentOrTutorTabBar.selectedItem = studentItem
        tv.register(UINib(nibName: "FAQTableViewCell", bundle: nil), forCellReuseIdentifier: "FAQTableViewCell")
        

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

struct StudentFAQList {
    var shortOrLong:Bool = true
    
    let short = ["Q1 수업 신청 후 절차가 어떻게 되나요?","Q2 수업료는 어떻게 결제하나요?", "Q3 수업 장소와 시간은 어떻게 되나요?","Q4 튜터들의 수업 퀄리티를 신뢰할 수 있을까요?","Q5첫 수업 시작 전에 급한 일이 생겼습니다.","Q6 수업 취소는 어떻게 할 수 있나요?","Q7 환불 금액은 언제 입금되나요?","Q8 수업 중간에 사정이 생겨 그만 둘 경우엔 어떻게 하나요?"]
    
    let long = ["수업 신청을 하시면 연결담당자가 연락을 드립니다^^ 연결담당자가 튜터와 연결해드리면 일정을 조율하여 첫 수업날짜를 잡아보세요.","연결담당자의 설명에 따라서 첫 1회 수업료를 탈잉에 선 결제하시면 튜터분과 연결됩니다. 튜터분과 첫 수업을 가져보시고, 향후 수업료는 튜터에게 직접 전달해주시면 됩니다. (수업료는 계좌이체 등으로 송금 근거를 남겨 두시길 권장합니다.)","수업소개에 수업장소와 시간이 명시되어 있습니다. 자세히 명시 되어있지 않은 수업의 경우 튜터와 조율하여 유동적으로 결정할 수 있습니다. 튜터에게 문의하여 시간을 조율해보세요. 개개인의 스케줄에 딱 맞는 시간을 조율할 수 있다는 것이탈잉의 가장 큰 장점이니까요.","탈잉에서 튜터에 대한 철저한 사전검증을 하게 되며, 프로필 상의 경력과 자격증에 대한 검수확인 과정을 거치게 됩니다. 또한 실제 수업을 들었던 수강생의 리뷰와 피드백을 통해 튜터의 평판을 지속적으로 관리합니다. 탈잉은 계속해서 튜터들의 신뢰도를 높일 수 있는 검증 시스템을 만들어 갈 것임을 약속드립니다.","첫 수업 이전에는 결제된 수업료가 100% 환불됩니다. 첫 수업을 진행하신 이후에는 결제금액의 환불이 불가합니다. 자세한 사안은 환불규정을 참고하세요!","첫 수업이 시작하기 전 신청 취소는 자유롭게 가능합니다.카카오 eclasshelp를 통해 취소 여부를 알려주시면 됩니다.","수업 환불은 신청자의 환불 신청일에 따라 환불규정이 적용되며, 탈잉 상담원이 확인 후 즉시 환불절차를 진행해 드립니다. 신용카드 결제의 경우 카드사의 사정에 따라 최대 10일이 소요될 수 있는 점 양해바랍니다.","첫 수업 이후 환불에 대해서는, 회원가입 및 수업 결제 시 수강생이 동의한 탈잉 환불규정에 따라 튜터와 수강생이 개별적으로 진행해주셔야 합니다."]
}

struct TutorFAQList {
    
    var shortOrLong:Bool = true
    let short = ["Q1 수업 등록은 아무나 할 수 있나요?", "Q2 수업은 어디서 진행하면 되나요?","Q3 수강생이 수업신청을 하게 되면 어떻게 연결되나요?","Q4 연결수수료가 있나요?","Q5 수업료는 어떻게 받나요?"]
    
    let long = ["누구나 수업 등록을 하실 수 있습니다.단, 수업 등록 후 관리자의 최종 승인이 있어야 홈페이지에 게시되고 신청을 받을 수 있습니다. 관리자는 등록된 수업내용, 이미지, 튜터 프로필 등의 적절성, 사 실확인을 검증한 이후 최종 승인을 해드립니다.","기본적으로 학교 근처 까페 혹은 교내 스터디룸/로비에서 수업을 진행합니다. 특별한 장소가 필요한 경우(Ex: 헬스PT, 춤, 피아노, 스포츠 등)는 탈잉과 제휴된 공간을 이용하시거나, 개인연습실과 같은 개인적인 공간, 학교헬스장 등 학교시설을 이용하셔도 됩니다. 수업장소가 여의치 않은 경우 탈잉센터로 우선 문의하여 주시기 바랍니다.","수강생이 신청을 하면 연결담당자가 연락을 해서 신청자분과 연결해드립니다.","‘첫 달’에 한해서 첫 회 수업료(첫 1시간 수업료)의 연결수수료가 있습니다. 연결수수료는 수강생이 튜터와 연결되기 전 탈잉 측으로 선 결제하게 됩니다.","첫 수업 이후, 향후 수업료(1달 기준 수업료에서 첫 회 1시간 수업료를 제외한 요금)는 수강생에게 직접 전달받으시면 됩니다."]
}
