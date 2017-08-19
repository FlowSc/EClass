//
//  DetailChangeUserInfoViewController.swift
//  TalingLoginView
//
//  Created by 김태형 on 2017. 8. 5..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit

class DetailChangeUserInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let propertyList = ["나이" , "이메일" , "휴대전화"]
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0
        {
            return "유저 정보 변경"
        }else
        {
            return "자기 소개 변경"
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1
        {
            return 15
        }else
        {
            
            return 30
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    @IBOutlet weak var tv: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
            return 4
        }else
        {
            return 1
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1
        {
            let footerView:UIView =
            {
                
                let label:UILabel =
                {
                    let lb = UILabel()
                    lb.text = "수정 완료"
                    lb.textColor = .white
                    
                    return lb
                    
                }()
                
                
                let view = UIView()
                view.backgroundColor = UIColor(red: 255/255, green: 125/255, blue: 83/255, alpha: 1)
                view.isUserInteractionEnabled = true
                view.addSubview(label)
                label.translatesAutoresizingMaskIntoConstraints = false
                view.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
                view.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(modifyCompletion(_:)))
                view.addGestureRecognizer(tapGesture)
                
                return view
            }()
            
            return footerView
        }else
        {
            let view1:UIView =
            {
                let v1 = UIView()
                v1.frame.size = CGSize(width: 0, height: 0)

                return v1
            }()

            return view1
        }
    
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0
        {
            return 0
        }else
        {
            
            return 60
        }
    }
    
    
    func modifyCompletion(_ sender:UITapGestureRecognizer)
    {
        //        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0
        {
            if indexPath.row == 0
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell0", for: indexPath) as! InputUserGenderTableViewCell
                
                return cell
            }else
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! InputUserDataTableViewCell
                cell.userDataSet(propertyList[indexPath.row - 1])
                cell.selectionStyle = .none
                return cell
            }
        }else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChangeSelfDescriptionTableViewCell", for: indexPath) as! ChangeSelfDescriptionTableViewCell
            
            return cell
        }
        
       
        
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tv.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.delegate = self
        
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
