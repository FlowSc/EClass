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

class DetailLogInViewController: UIViewController, UITextFieldDelegate{
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailTextFieldOutlet
        {
            passwordTextFieldOutlet.becomeFirstResponder()
        }else{
            logInButtonTouched(logInButtonOutlet)
        }
        return true
    }



    @IBAction func searchPasswordButtonTouched(_ sender: UIButton) {
        print("searchpassword")
        
    }
    
    @IBAction func logInButtonTouched(_ sender: UIButton) {
        
        if !(emailTextFieldOutlet.text?.isEmpty)! && !(passwordTextFieldOutlet.text?.isEmpty)!
        {
            
            
            
            Alamofire.request("http://localhost/1337").responseJSON(completionHandler: { (response) in
                
                let responseData = JSON(response.result.value!)
                
                for userData in responseData
                {
                    
                }
            })
            let mainStoryBoard = UIStoryboard(name: "MainPage", bundle: nil)
            let storyRootView = mainStoryBoard.instantiateViewController(withIdentifier: "MainTableViewController")
            
            
            self.present(storyRootView, animated: true, completion: nil)
            print("login")
            
            
        }
    }
    @IBOutlet weak var logInButtonOutlet: UIButton!
    @IBOutlet weak var passwordTextFieldOutlet: UITextField!
    @IBOutlet weak var emailTextFieldOutlet: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextFieldOutlet.delegate = self
        emailTextFieldOutlet.delegate = self
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailTextFieldOutlet.becomeFirstResponder()
        
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
