//
//  LogInViewController.swift
//  EducationProject
//
//  Created by 김태형 on 2017. 7. 27..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class LogInViewController: UIViewController {

    @IBAction func emailLoginButtonTouched(_ sender: UIButton) {
        
        let detailLoginViewController = storyboard?.instantiateViewController(withIdentifier: "DetailLogInViewController") as! DetailLogInViewController
        self.navigationController?.pushViewController(detailLoginViewController, animated: true)

    }
    @IBAction func faceBookLoginButtonTouched(_ sender: UIButton) {
        
        
        
        print("facebooklogin")
    }
    @IBAction func signUpButtonTouched(_ sender: UIButton) {
        
        let signUpViewController = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @IBOutlet weak var emailLoginButtonOutlet: UIButton!
    @IBOutlet weak var faceBookLoginButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.navigationBar.isHidden = true
        logInButtonOutletSet()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func logInButtonOutletSet()
    {
        faceBookLoginButtonOutlet.layer.cornerRadius = 5
        emailLoginButtonOutlet.layer.cornerRadius = 5
        emailLoginButtonOutlet.layer.borderColor = UIColor.black.cgColor
        emailLoginButtonOutlet.layer.borderWidth = 1
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
