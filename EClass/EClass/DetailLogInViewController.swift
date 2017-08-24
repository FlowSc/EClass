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
import SwiftyGif
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

                currentUserTuTorPK = realData["user"]["tutor_pk"].intValue

                if response.result.isSuccess
                {
                    if realData["detail"] == nil
                    {
                        DataCenter.shared.realUser = User(with: realData)
                        
                        let result = JSON(response.value!)
                        
                        
                        let userToken = result["token"].stringValue
                        let userName = result["user"]["username"].stringValue
                        let userPk = result["user"]["user_pk"].intValue
                        let userNickname = result["user"]["nickname"].stringValue
                        
                        let mainStoryBoard = UIStoryboard(name: "MainPage", bundle: nil)
                        let pushMainView = mainStoryBoard.instantiateViewController(withIdentifier: "reveal1")
                        
                        
                        UserDefaults.standard.set(self.passWordTextField.text, forKey: "UserPassword")
                        UserDefaults.standard.set(userToken, forKey: "UserToken")
                        UserDefaults.standard.set(userName, forKey: "UserName")
                        UserDefaults.standard.set(userPk, forKey: "UserPK")
                        UserDefaults.standard.set(userNickname, forKey: "UserNickname")
                        
                        
                        if !(userToken == ""){
                            
                            let mainStoryBoard = UIStoryboard(name: "MainPage", bundle: nil)
                            let pushMainView = mainStoryBoard.instantiateViewController(withIdentifier: "reveal1")
                            self.present(pushMainView, animated: true, completion: nil)
                            
                        }
                    }
                }
                let alertController = UIAlertController.init(title: "로그인 실패", message: "유저 정보가 일치하지 않습니다", preferredStyle: UIAlertControllerStyle.alert)
                let alertAction = UIAlertAction.init(title: "다시 확인해주세요!", style: UIAlertActionStyle.cancel, handler: nil)
                
                alertController.addAction(alertAction)
                
                self.present(alertController, animated: true, completion: nil)
            
            }
        }
    }
    
    @IBOutlet weak var webViewBG: UIWebView!
    @IBOutlet weak var marginView4: UIView!
    @IBOutlet weak var marginView3: UIView!
    @IBOutlet weak var marginView2: UIView!
    @IBOutlet weak var marginView1: UIView!
    @IBOutlet weak var logInButtonOutlet: UIButton!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
            self.outletSet()
        
        passWordTextField.delegate = self
        userNameTextField.delegate = self
        
      

        
        
        
        // Do any additional setup after loading the view.
    }
    
    func outletSet()
    {
        
        let htmlPath = Bundle.main.path(forResource: "WebViewContent", ofType: "html")
        let htmlURL = URL(fileURLWithPath: htmlPath!)
        let html = try? Data(contentsOf: htmlURL)
        
        self.webViewBG.load(html!, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: htmlURL.deletingLastPathComponent())

        
//        let gifManager = SwiftyGifManager(memoryLimit:20)
//        let gif = UIImage(gifName: "ronaldo.gif")
////        let imageview = UIImageView(gifImage: gif, manager: gifManager)
////        imageview.frame = CGRect(x: 0.0, y: 5.0, width: (self.view.frame.width), height: (self.view.frame.height))
////        imageview.alpha = 0.5
////        view.addSubview(imageview)
//        
//        let filter = UIView()
//        filter.frame = self.view.frame
//        filter.backgroundColor = UIColor.black
//        filter.alpha = 0.05
//        self.detailLoginImageView.addSubview(filter)
//
//        detailLoginImageView = UIImageView(gifImage: gif, manager: gifManager)
//        detailLoginImageView.clipsToBounds = true
////        detailLoginImageView.alpha = 0.6
        self.navigationController?.navigationBar.alpha = 0.3
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.isNavigationBarHidden = true
        
        //        self.navigationController?.navigationItem.backBarButtonItem?.tintColor = .black
        logInButtonOutlet.setBasicColor()
        logInButtonOutlet.layer.cornerRadius = 5
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
