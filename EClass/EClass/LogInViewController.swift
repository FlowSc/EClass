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
import FacebookLogin
import FacebookCore

class LogInViewController: UIViewController {

    @IBOutlet weak var loginImageView: UIImageView!
    @IBAction func emailLoginButtonTouched(_ sender: UIButton) {
        
        let detailLoginViewController = storyboard?.instantiateViewController(withIdentifier: "DetailLogInViewController") as! DetailLogInViewController
        self.navigationController?.pushViewController(detailLoginViewController, animated: true)
        self.navigationController?.navigationBar.isHidden = false
        

    }
    @IBAction func faceBookLoginButtonTouched(_ sender: UIButton) {
        
        let loginManager = LoginManager()
        
        loginManager.logIn([.publicProfile], viewController: self) { (result) in
            switch result {
            case .failed(let error):
                print(error.localizedDescription)
            case .cancelled:
                print("cancelled")
            case .success(_, _, let userInfo):
                
                print("\(userInfo.authenticationToken)")
                print("\(userInfo.appId)")
                print("\(userInfo.userId!)")
                
                let params = ["username":userInfo.userId,"password":userInfo.authenticationToken]
                Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/login/facebook/", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
                    
                    
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
                        
                        Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/profile/\(userInfo.userId)/", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization":"\(response.data)"]).responseJSON(completionHandler: { (response) in
                            guard let data = response.result.value else
                            {
                                return
                            }
                            let jsonData = JSON(data)
                            print("여기서부터제이슨")
                            print(jsonData)
                            print("여기까지")
                        })
                        print("go")
                        let mainStoryBoard = UIStoryboard(name: "MainPage", bundle: nil)
                        let pushMainView = mainStoryBoard.instantiateViewController(withIdentifier: "reveal1")
                        self.present(pushMainView, animated: true, completion: nil)
                    }else
                    {
                        print(response.result)
                    }
                    
                }
                
            }
        }
        
    }
    @IBAction func signUpButtonTouched(_ sender: UIButton) {
        
        let signUpViewController = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(signUpViewController, animated: true)
        self.navigationController?.navigationBar.isHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBOutlet weak var emailLoginButtonOutlet: UIButton!
    @IBOutlet weak var faceBookLoginButtonOutlet: UIButton!
    
    
    @IBOutlet weak var marginView2: UIView!
    @IBOutlet weak var marginView1: UIView!
    override func viewDidLoad() {
        
//        if UserDefaults.standard.string(forKey: "UserPK") != nil
//        {
//            currentUserPrimaryKey = UserDefaults.standard.integer(forKey: "UserPK")
//            currentUserToken = UserDefaults.standard.string(forKey: "UserToken")!
//            
//            currentUserTuTorPK = UserDefaults.standard.integer(forKey: "TutorPK")
//            
////            currentUserName = UserDefaults.standard.string(forKey: "UserName")
////            currentUserNickname = UserDefaults.standard.string(forKey: "UserNickname") ?? "Default"
//            currentUserData = DataCenter.shared.realUser
//            
//            
//            let mainStoryBoard = UIStoryboard(name: "MainPage", bundle: nil)
//            let pushMainView = mainStoryBoard.instantiateViewController(withIdentifier: "reveal1")
//            self.present(pushMainView, animated: false, completion: nil)
//        }
        
        self.navigationController?.navigationBar.isHidden = true
        super.viewDidLoad()
        
        Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/regiclass/class/list/", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            guard let data = response.result.value else{return}
            
            let lectureData = JSON(data)
            
            LectureList.lectureList = lectureData
        }


        outletSet()
        
//        
//        if !(UserDefaults.standard.string(forKey: "UserToken")! == "") {
//            
//            let mainStoryBoard = UIStoryboard(name: "MainPage", bundle: nil)
//            let pushMainView = mainStoryBoard.instantiateViewController(withIdentifier: "reveal1")
//            self.present(pushMainView, animated: false, completion: nil)
//            
//            
//            
//        }

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func outletSet()
    {
        marginView1.backgroundColor = .clear
        marginView2.backgroundColor = .clear
        
        
        
        loginImageView.image = UIImage(named: "passion2.png")
        loginImageView.isUserInteractionEnabled = false
        loginImageView.alpha = 0.9
        loginImageView.clipsToBounds = true
        faceBookLoginButtonOutlet.layer.cornerRadius = 5
        emailLoginButtonOutlet.layer.cornerRadius = 5
        emailLoginButtonOutlet.layer.borderColor = UIColor.white.cgColor
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
