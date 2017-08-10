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
        return "유저 정보 변경"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    @IBOutlet weak var tv: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        
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
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60
    }
    
    
    func modifyCompletion(_ sender:UITapGestureRecognizer)
    {
//        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell0", for: indexPath) as! inputUserGenderTableViewCell
            
            return cell
        }else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! inputUserDataTableViewCell
            cell.userDataSet(propertyList[indexPath.row - 1])
            cell.selectionStyle = .none
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
