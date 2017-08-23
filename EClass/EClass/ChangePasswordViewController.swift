//
//  ChangePasswordViewController.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 23..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import Alamofire

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var newPassword2: UITextField!
    @IBOutlet weak var newPassword1: UITextField!
    @IBOutlet weak var oldPassword: UITextField!
    @IBOutlet weak var imageView1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView1.image = UIImage(named: "lock.jpeg")
        marginView1.backgroundColor = .clear
        marginView2.backgroundColor = .clear
        marginView3.backgroundColor = .clear
        marginView4.backgroundColor = .clear
        imageView1.alpha = 0.7
        imageView1.layer.cornerRadius = 5
        

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var marginView4: UIView!
    @IBOutlet weak var marginView3: UIView!
    @IBOutlet weak var marginView2: UIView!
    @IBOutlet weak var marginView1: UIView!

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.alpha = 0.5
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func changeButtonTouched(_ sender: UIButton) {
        if !(oldPassword.text?.isEmpty)! && !(newPassword1.text?.isEmpty)! && !(newPassword2.text?.isEmpty)! && newPassword1.text == newPassword2.text
        {
            
            Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/change/password/" + "\(currentUserPrimaryKey)/", method: .patch, parameters: ["old_password":"\(oldPassword.text!)","new_password1":"\(newPassword1.text!)","new_password2":"\(newPassword2.text!)"], encoding: JSONEncoding.default, headers: ["Authorization":"Token " + "\(currentUserToken)"]).responseJSON { (response) in
                if response.result.isSuccess
                {
                    print("!!!!!!!!!!!!!")
//                    currentUserData = User(with: JSON(response.result.value))
                    self.navigationController?.navigationBar.alpha = 1
                    self.navigationController?.popViewController(animated: true)
                }
                
                print(response.result)
            }
        }
        
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
