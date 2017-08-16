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

    @IBOutlet weak var passwordCheckTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var signUpButtonOutlet: UIButton!
    @IBAction func signUpButtonTouched(_ sender: UIButton) {
        if !(userNameTextField.text?.isEmpty)! && !(passwordTextField.text?.isEmpty)! && !(passwordCheckTextField.text?.isEmpty)! && !(emailTextField.text?.isEmpty)! &&
        passwordCheckTextField.text == passwordTextField.text
        {
            
            postDicToUserInfo(params: ["username":"\(userNameTextField.text!)","password":passwordTextField.text!, "email":emailTextField.text!])
            let mainStoryBoard = UIStoryboard(name: "MainPage", bundle: nil)
            let pushMainView = mainStoryBoard.instantiateViewController(withIdentifier: "reveal") as! SWRevealViewController
            self.present(pushMainView, animated: true, completion: nil)
        }
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


    override func viewDidLoad() {
        super.viewDidLoad()
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
