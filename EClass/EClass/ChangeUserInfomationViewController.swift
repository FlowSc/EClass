//
//  ChangeUserInfomationViewController.swift
//  TalingLoginView
//
//  Created by 김태형 on 2017. 8. 3..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

var currentUserData = DataCenter.shared.realUser
//func refreshCurrentUserData()
//{
//    currenUserData = DataCenter.shared.realUser
//}

class ChangeUserInfomationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    

//    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
//        scrollView.delegate = self
//        scrollView.alwaysBounceVertical = false
//        return false
//    }
    
//  
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scroll")
    }
    
    @IBOutlet weak var tv: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.bounces = false
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! ProfileImageTableViewCell
            cell.userNameLabel.text = currentUserData?.userName ?? "guest"
            cell.profileImageOutlet.image = currentUserData?.profileImage
            cell.selectionStyle = .none
            
           
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! ProfileTableViewCell
            cell.setIcon(data: indexPath.row + 8)
            if indexPath.row == 0
            {
                cell.setUserInfoLabel(data: (currentUserData?.name) ?? "이름을 알려주세요")
            }else if indexPath.row == 1
            {
                cell.setUserInfoLabel(data: (currentUserData?.nickName) ?? "닉네임을 알려주세요")
            }else if indexPath.row == 2
            {
                cell.setUserInfoLabel(data: (currentUserData?.email) ?? "이메일을 알려주세요")
            }else
            {
                cell.setUserInfoLabel(data: (currentUserData?.phone) ?? "휴대폰 번호를 알려주세요")
            }
            cell.selectionStyle = .none
            return cell
//        default:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! SelfDescriptionTableViewCell
//            cell.setSelected(true, animated: false)
//            
//            
//            return cell
//        default:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath)
//            cell.selectionStyle = .none
//            
//            return cell
            
        }
    }
    
//    @IBAction func goBackButtonTouched(_ sender: UIBarButtonItem) {
//        
////        self.navigationController?.popViewController(animated: true)
//        self.dismiss(animated: true, completion: nil)
//        print("1")
//        
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let main2StoryBoard = UIStoryboard(name: "Main2", bundle: nil)
//        
////        let changeVIew = main2StoryBoard.instantiateViewController(withIdentifier: "SelfDescriptionTableViewCell") as! SelfDescriptionTableViewCell
////        self.navigationController?.pushViewController(changeVIew, animated: true)
//    }
//    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//        let modifyAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "수정") { (action, indexPath) in
//            let storyBoard2 = UIStoryboard(name: "Main2", bundle: nil)
//            let changeView2 = storyBoard2.instantiateViewController(withIdentifier: "DetailChangeUserInfoViewController") as! DetailChangeUserInfoViewController
//            self.navigationController?.pushViewController(changeView2, animated: true)
//            
//        }
//        modifyAction.backgroundColor = .gray
//        
//        
//        return [modifyAction]
//    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 180
        default:
            return 50
        }
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        if section == 1
//        {
//            
////            let button1:UIButton =
////            {
////                let btn = UIButton()
////                btn.setTitle("정보 수정", for: .normal)
////                btn.addTarget(self, action: #selector(goChangeUserInfoViewController), for: .touchUpInside)
////                return btn
////            }()
////            ChangeUserInfoView.backgroundColor = .gray
////            ChangeUserInfoView.addSubview(button1)
////            button1.translatesAutoresizingMaskIntoConstraints = false
////            button1.centerXAnchor.constraint(equalTo: ChangeUserInfoView.centerXAnchor).isActive = true
////            button1.centerYAnchor.constraint(equalTo: ChangeUserInfoView.centerYAnchor).isActive = true
//            print("1")
//            
//            
//            return changeUserView
//            
//        }else
//        {
//           return UIView()
//        }
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    

    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0
        {
            return "프로필"
        }else if section == 1
        {
            return "유저 정보"
        }else
        {
            return "자기 소개"
        }
//        }else
//        {
//            return "부가 정보"
//        }
    }

    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 0
//        {
//            return tableView.tableHeaderView
//        }
//    }
    
    
    
    @IBOutlet weak var changeUserView: UIView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        default:
            return 4
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
//        return 4
        return 2
    }
    func goChangeUserViewController(_ sender:UITapGestureRecognizer)
    {
        let changeVIew = storyboard?.instantiateViewController(withIdentifier: "DetailChangeUserInfoViewController") as! DetailLogInViewController
        self.navigationController?.pushViewController(changeVIew, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tv.reloadData()
        
        print("viewwillappear")
        print(currentUserData)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        changeUserView.isUserInteractionEnabled = true // 이거 해야 터치 먹음!!!!!!!!!
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goChangeUserViewController(_:)))
//        changeUserView.addGestureRecognizer(tapGesture)
//        
//
//        tv.register(Bundle.self, forHeaderFooterViewReuseIdentifier: "view")
        


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
