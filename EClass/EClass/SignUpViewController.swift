//
//  SignUpViewController.swift
//  TalingLoginView
//
//  Created by 김태형 on 2017. 7. 31..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftyGif

class SignUpViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var loginImageView: UIImageView!
    @IBOutlet weak var passwordCheckTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var signUpButtonOutlet: UIButton!
    @IBAction func signUpButtonTouched(_ sender: UIButton) {
        if !(userNameTextField.text?.isEmpty)! && !(passwordTextField.text?.isEmpty)! && !(passwordCheckTextField.text?.isEmpty)! && !(emailTextField.text?.isEmpty)! &&
        passwordCheckTextField.text == passwordTextField.text
        {
            
            let params = ["username":userNameTextField.text!,"password":passwordTextField.text!,"confirm_password":passwordTextField.text!,"email":emailTextField.text!]
            Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/signup/", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
                guard let data = response.value else
                {
                    return
                }
                
                let realData = JSON(data)
                currentUserPrimaryKey = realData["user"]["user_pk"].intValue
                currentUserToken = realData["token"].stringValue
                currentUserTuTorPK = realData["user"]["tutor_pk"].int ?? 0
                
                
                if response.result.isSuccess
                {
                    
                    
                    DataCenter.shared.realUser = User(with: realData)
                    
                    let result = JSON(response.value!)
                    
                    
                    let userToken = result["token"].stringValue
                    let userName = result["user"]["username"].stringValue
                    let userPk = result["user"]["user_pk"].intValue
                    let userNickname = result["user"]["nickname"].stringValue
                    
                    
                    UserDefaults.standard.set(userToken, forKey: "UserToken")
                    UserDefaults.standard.set(userName, forKey: "UserName")
                    UserDefaults.standard.set(userPk, forKey: "UserPK")
                    UserDefaults.standard.set(userNickname, forKey: "UserNickname")
                
                    
                    let mainStoryBoard = UIStoryboard(name: "MainPage", bundle: nil)
                    let pushMainView = mainStoryBoard.instantiateViewController(withIdentifier: "reveal1")
                    self.present(pushMainView, animated: true, completion: nil)
                    
                    
                }
            }
        
//            self.present(presentAlert("알수 없는 오류!", message: "이럴 리가 없는데", alertActionTitle: "힝"), animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        outletSet()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        passwordCheckTextField.delegate = self
        emailTextField.delegate = self
        userNameTextField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var marginView6: UIView!
    @IBOutlet weak var marginView7: UIView!
    
    @IBAction func backButtonTouched(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var marginView5: UIView!
    @IBOutlet weak var marginView4: UIView!
    @IBOutlet weak var marginView3: UIView!
    @IBOutlet weak var marginView2: UIView!
    @IBOutlet weak var marginView1: UIView!
    func outletSet()
    {
//        loginImageView.image = UIImage(named: "passion0.png")
//        loginImageView.clipsToBounds = true
//        loginImageView.alpha = 0.9
        self.navigationController?.navigationBar.isHidden = true
        let gif = UIImage(gifName: "railway.gif")
        let gifManager = SwiftyGifManager(memoryLimit:20)
        loginImageView.setGifImage(gif, manager: gifManager)
        
//        let jeremyGif = UIImage.init(gifName: "railway")
//        loginImageView = UIImageView(image: jeremyGif)
//        loginImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        marginView1.backgroundColor = .clear
        marginView2.backgroundColor = .clear
        marginView3.backgroundColor = .clear
        marginView4.backgroundColor = .clear
        marginView5.backgroundColor = .clear
        marginView6.backgroundColor = .clear
        marginView7.backgroundColor = .clear
        signUpButtonOutlet.layer.borderColor = UIColor.white.cgColor
        signUpButtonOutlet.layer.cornerRadius = 5
        signUpButtonOutlet.layer.borderWidth = 1
        self.navigationController?.navigationBar.alpha = 0.5
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        
        
        
    }
    //    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //        if textField == userNameTextField
    //        {
    //            passwordTextField.becomeFirstResponder()
    //        }else if textField == passwordTextField
    //        {
    //            passwordCheckTextField.becomeFirstResponder()
    //        }else if textField == passwordCheckTextField
    //        {
    //            lastNameTextField.becomeFirstResponder()
    //        }else if textField == lastNameTextField
    //        {
    //            firstNameTextField.becomeFirstResponder()
    //        }else
    //        {
    //            signUpButtonTouched(signUpButtonOutlet)
    //        }
    //        return true
    //    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
