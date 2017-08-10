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

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    @IBAction func signUpButtonTouched(_ sender: UIButton) {
        if !(emailTextField.text?.isEmpty)! && !(passwordTextField.text?.isEmpty)! && !(passwordCheckTextField.text?.isEmpty)! && !(lastNameTextField.text?.isEmpty)! && !(firstNameTextField.text?.isEmpty)! &&
        passwordCheckTextField.text == passwordTextField.text
        {
            
            let mainStoryBoard = UIStoryboard(name: "MainPage", bundle: nil)
            let storyRootView = mainStoryBoard.instantiateViewController(withIdentifier: "MainTableViewController")

        
            self.present(storyRootView, animated: true, completion: nil)
            
            let postUserData = JSON(["id":emailTextField.text!,"password":passwordTextField.text!,"name":lastNameTextField.text! + firstNameTextField.text!])
            
            
            print("signup")
        }
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField
        {
            passwordTextField.becomeFirstResponder()
        }else if textField == passwordTextField
        {
            passwordCheckTextField.becomeFirstResponder()
        }else if textField == passwordCheckTextField
        {
            lastNameTextField.becomeFirstResponder()
        }else if textField == lastNameTextField
        {
            firstNameTextField.becomeFirstResponder()
        }else
        {
            signUpButtonTouched(signUpButtonOutlet)
        }
        return true
    }
    

    @IBOutlet weak var passwordCheckTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordCheckTextField.delegate = self
        lastNameTextField.delegate = self
        firstNameTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailTextField.becomeFirstResponder()
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
