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
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == userNameTextField
        {
            passWordTextField.becomeFirstResponder()
        }else{
            logInButtonTouched(logInButtonOutlet)
        }
        return true
    }



    @IBAction func searchPasswordButtonTouched(_ sender: UIButton) {
        print("searchpassword")
        
    }
    @IBAction func logInButtonTouched(_ sender: UIButton) {
        
        if !(userNameTextField.text?.isEmpty)! && !(passWordTextField.text?.isEmpty)!
        {
            let params = ["username":userNameTextField.text!,"password":passWordTextField.text!]
            Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/login/", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
                guard let data = response.result.value else
                {
                    return
                }
                
                if response.result.isSuccess
                {
                    print(response.description)
                    print("response")
                    print(response)
                    print("data")
                    print(JSON(response.value))
                    print("data끝")
                    print(JSON(response.data))
                    print(response.timeline)
                    print(response.metrics)
                    print(response.request)
                    print(response.response)

                    print("go")
                    let mainStoryBoard = UIStoryboard(name: "MainPage", bundle: nil)
                    let pushMainView = mainStoryBoard.instantiateViewController(withIdentifier: "reveal1")
                    self.present(pushMainView, animated: true, completion: nil)
                }

            }

            print("login")

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
        detailLoginImageView.alpha = 0.8
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
