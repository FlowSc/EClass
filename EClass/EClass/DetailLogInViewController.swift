//
//  DetailLogInViewController.swift
//  TalingLoginView
//
//  Created by 김태형 on 2017. 7. 31..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var loginSuccess:Bool = false

class DetailLogInViewController: UIViewController, UITextFieldDelegate{
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        
        if textField == userNameTextField
        {
            passWordTextField.becomeFirstResponder()
        }else{
            logInButtonTouched(logInButtonOutlet)
        }
        return true
    }
    
    
    
    @IBAction func searchPasswordButtonTouched(_ sender: UIButton)
    {
        print("searchpassword")
        
    }
    @IBAction func logInButtonTouched(_ sender: UIButton)
    {
        
        
        if !(userNameTextField.text?.isEmpty)! && !(passWordTextField.text?.isEmpty)!
        {
            let params = ["username":userNameTextField.text!,"password":passWordTextField.text!]
            Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/login/", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
                guard let data = response.result.value else
                {
                    return
                }
                
                
                    
                    
                    
                let realData = JSON(data)
                currentUserPrimaryKey = realData["user"]["user_pk"].intValue
                currentUserToken = realData["token"].stringValue

                
                let result = JSON(response.value!)
                
                let userToken = result["token"].stringValue
                let userName = result["user"]["username"].stringValue
                let userPk = result["user"]["user_pk"].intValue
                let userNickname = result["user"]["nickname"].stringValue
                
                
                UserDefaults.standard.set(userToken, forKey: "UserToken")
                UserDefaults.standard.set(userName, forKey: "UserName")
                UserDefaults.standard.set(userPk, forKey: "UserPK")
                UserDefaults.standard.set(userNickname, forKey: "UserNickname")

                
                
                print("TOKENVALUE \(userToken)")
                
                
                if !(userToken == ""){
                    
                    let mainStoryBoard = UIStoryboard(name: "MainPage", bundle: nil)
                    let pushMainView = mainStoryBoard.instantiateViewController(withIdentifier: "reveal1")
                    
//                    mainVc.currentUserToken = userToken
//                    mainVc.userData = result
                    
                    
                    currentUserData = DataCenter.shared.realUser
                    
                    print("login")

                    self.present(pushMainView, animated: true, completion: nil)
                    
                }
                let alertController = UIAlertController.init(title: "로그인 실패", message: "유저 정보가 일치하지 않습니다", preferredStyle: UIAlertControllerStyle.alert)
                let alertAction = UIAlertAction.init(title: "다시 확인해주세요!", style: UIAlertActionStyle.cancel, handler: nil)
                    
                alertController.addAction(alertAction)
                    
                self.present(alertController, animated: true, completion: nil)
                
            }
            
        
        }
    }
    @IBOutlet weak var marginView4: UIView!
    @IBOutlet weak var marginView3: UIView!
    @IBOutlet weak var marginView2: UIView!
    @IBOutlet weak var detailLoginImageView: UIImageView!
    @IBOutlet weak var marginView1: UIView!
    @IBOutlet weak var logInButtonOutlet: UIButton!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        outletSet()
        passWordTextField.delegate = self
        userNameTextField.delegate = self
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func outletSet()
    {
        detailLoginImageView.image = UIImage(named: "passion1.png")
        detailLoginImageView.clipsToBounds = true
        detailLoginImageView.alpha = 0.6
        self.navigationController?.navigationBar.alpha = 0.5
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        //        self.navigationController?.navigationItem.backBarButtonItem?.tintColor = .black
        logInButtonOutlet.layer.borderColor = UIColor.white.cgColor
        logInButtonOutlet.layer.cornerRadius = 5
        logInButtonOutlet.layer.borderWidth = 1
        marginView1.backgroundColor = .clear
        marginView2.backgroundColor = .clear
        marginView3.backgroundColor = .clear
        marginView4.backgroundColor = .clear
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameTextField.becomeFirstResponder()
        
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
