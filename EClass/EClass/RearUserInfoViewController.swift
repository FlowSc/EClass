//
//  RearUserInfoViewController.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 11..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class RearUserInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tv: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return 220
        }else
        {
            return 50
        }
    }
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        
//        let footerView:UIView =
//        {
//            
//            let label:UILabel =
//            {
//                let lb = UILabel()
//                lb.text = "수업 등록하기"
//                lb.textColor = .white
//                
//                return lb
//                
//            }()
//            
//            
//            let view = UIView()
//            view.backgroundColor = UIColor(red: 255/255, green: 125/255, blue: 83/255, alpha: 1)
//            view.isUserInteractionEnabled = true
//            view.addSubview(label)
//            label.translatesAutoresizingMaskIntoConstraints = false
//            view.centerXAnchor.constraint(equalTo: label.centerXAnchor, constant: 30).isActive = true
//            view.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
//            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(registerLectureButtonTouched(_:)))
//            view.addGestureRecognizer(tapGesture)
//            
//            return view
//        }()
//        
//        return footerView
//
//    }
    
    func registerLectureButtonTouched(_:UIGestureRecognizer)
    {
        print("tap")
    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 50
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: "userInfo", sender: nil)
        
        if indexPath.row == 2
        {
            let storyBoard1 = UIStoryboard(name: "ListOfLecture", bundle: nil)
            let nextVC = storyBoard1.instantiateViewController(withIdentifier: "ListList") as! ListOfLectureViewController
            self.navigationController?.pushViewController(nextVC, animated: true)
            self.navigationController?.isNavigationBarHidden = false
        }else if indexPath.row == 3{
            let storyBoard1 = UIStoryboard(name: "FAQViewController", bundle: nil)
            let nextVC = storyBoard1.instantiateViewController(withIdentifier: "FAQ") as! FAQViewController
            self.navigationController?.pushViewController(nextVC, animated: true)
            self.navigationController?.isNavigationBarHidden = false
        }else{
            let storyBoard1 = UIStoryboard(name: "Main2", bundle: nil)
            let nextVC = storyBoard1.instantiateViewController(withIdentifier: "user") as! ChangeUserInfomationViewController
            self.navigationController?.pushViewController(nextVC, animated: true)
            self.navigationController?.isNavigationBarHidden = false
        }
        
//        self.navigationController?.pushViewController(nextVC, animated: true)
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell0", for: indexPath) as! RearProfileImageTableViewCell
            cell.selectionStyle = .none
//            cell.backgroundColor = UIColor(white: 0, alpha: 0.1)
            return cell
        }else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! RearSettingTableViewCell
            cell.set(indexPath.row)
            tv.tableFooterView = UIView(frame: CGRect.zero)
            cell.selectionStyle = .none
            return cell
        }
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        view1.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tv.reloadData()
//        userNameLabel.text = currentUserData?.userName
//        emailLabel.text = currentUserData?.email
        self.navigationController?.isNavigationBarHidden = true
//        self.view.addSubview(view1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
