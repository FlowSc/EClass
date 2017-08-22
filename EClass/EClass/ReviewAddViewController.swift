//
//  ReviewAddViewController.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 14..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ReviewAddViewController: UIViewController {
    
    var classData:JSON!
    var loginUserData:JSON!
    var loginToken:String!
    var loginUserName:String!
    
    @IBAction func registButtonTouched(_ sender: Any) {
        
        let myParameter = ["lecture_id":classData["id"].stringValue,"curriculum_rate":"5", "delivery_rate":"5", "preparation_rate":"5", "kindness_rate":"5", "punctually_rate":"5", "content":reviewContentTextView.text] as [String : String]
        print(myParameter)
        
        addReview(params: myParameter)
    }
    @IBOutlet weak var reviewContentTextView: UITextView!

    @IBOutlet weak var registButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("~~~~~~~~~~~~~~~~")
        print(classData)
        
        loginToken = UserDefaults.standard.string(forKey: "UserToken")!
        loginUserName = UserDefaults.standard.string(forKey: "UserName")!
        
        print(UserDefaults.standard.string(forKey: "UserToken")!)
        print("Token " + "\(loginToken!)")
        print(loginUserName)

        print("~~~~~~~~~~~")

        registButton.backgroundColor = UIColor(red: 255/255, green: 125/255, blue: 83/255, alpha: 1)
        registButton.setTitleColor(.white, for: .normal)
        reviewContentTextView.backgroundColor = .gray
//        registButton.addTarget(self, action: #selector(addReview), for: .touchUpInside)

        print(classData["id"].stringValue)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addReview(params:[String:String]){
        
//        let params:Parameters = [classData["id"].intValue, 5, 5, 5, 5, 5, reviewContentTextView.text]
        
//        let params:[String:Any]!
        
//        params = ["lecture_id":classData["id"].stringValue,"curriculum_rate":5, "delivery_rate":5, "preparation_rate":5, "kindness_rate":5, "punctually_rate":5, "content":reviewContentTextView.text]
//        
            Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/regiclass/review/make/", method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: ["Authorization":"Token \(loginToken!)"]).responseJSON { (response) in
         
            print("response Start")
            print(response.result.value)
            print(response.response?.statusCode)
            
            print("response End")
                
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    

//
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

