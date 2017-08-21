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
            
            postDicToUserInfo(params: ["username":"\(userNameTextField.text!)","password":passwordTextField.text!, "email":emailTextField.text!, "confirm_password":"\(passwordCheckTextField.text!)"])
            
            
            let mainStoryBoard = UIStoryboard(name: "MainPage", bundle: nil)
            let pushMainView = mainStoryBoard.instantiateViewController(withIdentifier: "reveal1")
            self.present(pushMainView, animated: true, completion: nil)
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
    
    @IBOutlet weak var marginView5: UIView!
    @IBOutlet weak var marginView4: UIView!
    @IBOutlet weak var marginView3: UIView!
    @IBOutlet weak var marginView2: UIView!
    @IBOutlet weak var marginView1: UIView!
    func outletSet()
    {
        loginImageView.image = UIImage(named: "passion0.png")
        loginImageView.clipsToBounds = true
        loginImageView.alpha = 0.9
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
