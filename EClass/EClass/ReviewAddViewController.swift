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
import StarReview
import SnapKit
import SwiftyStarRatingView

class ReviewAddViewController: UIViewController, UITextViewDelegate {
    
    var classData:JSON!
    var loginUserData:JSON!
    var loginToken:String!
    var loginUserName:String!
    var curriculumScore:CGFloat!
    var kindnessScore:CGFloat!
    var deliveryScore:CGFloat!
    var preparationScore:CGFloat!
    var punctuallyScore:CGFloat!
    
    @IBOutlet weak var curriculumStar: SwiftyStarRatingView!
   
    @IBOutlet weak var preparationStar: SwiftyStarRatingView!
 
    @IBOutlet weak var kindnessStar: SwiftyStarRatingView!
    @IBOutlet weak var deliveryStar: SwiftyStarRatingView!
    @IBOutlet weak var punctuallyStar: SwiftyStarRatingView!
    
    @IBAction func registButtonTouched(_ sender: Any) {
        
        let myParameter = ["lecture_id":classData["id"].stringValue,"curriculum_rate":curriculumScore, "delivery_rate":deliveryScore, "preparation_rate":preparationScore, "kindness_rate":kindnessScore, "punctually_rate":punctuallyScore, "content":reviewContentTextView.text] as [String : Any]
        print(myParameter)
        
        addReview(params: myParameter)
    }
    
    
    
    @IBOutlet weak var reviewContentTextView: UITextView!
    
    @IBOutlet weak var registButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewContentTextView.delegate = self

        
        
        print("~~~~~~~~~~~~~~~~")
        print(classData)
        loginToken = UserDefaults.standard.string(forKey: "UserToken")!
        loginUserName = UserDefaults.standard.string(forKey: "UserName")!
        
        print("Token " + "\(loginToken!)")
        print(loginUserName)
        print("~~~~~~~~~~~")
        
        registButton.backgroundColor = UIColor(red: 255/255, green: 125/255, blue: 83/255, alpha: 1)
        registButton.setTitleColor(.white, for: .normal)
        reviewContentTextView.backgroundColor = .gray
        
        kindnessStar.addTarget(self, action: #selector(reviewScoreForKindness), for: .valueChanged)
        deliveryStar.addTarget(self, action: #selector(reviewForDelivery), for: .valueChanged)
        punctuallyStar.addTarget(self, action: #selector(reviewForPunctually), for: .valueChanged)
        preparationStar.addTarget(self, action: #selector(reviewScoreForPreparation), for: .valueChanged)
        curriculumStar.addTarget(self, action: #selector(reviewScoreForCurriculum), for: .valueChanged)
        
        
        print(classData["id"].stringValue)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addReview(params:[String:Any]){
        
        
        Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/regiclass/review/make/", method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: ["Authorization":"Token \(loginToken!)"]).responseJSON { (response) in
            
            print("response Start")
            print(response.result.value)
            print(response.response?.statusCode)
            
            print("response End")
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func reviewScoreForKindness() {
        print(kindnessStar.value)
        
        kindnessScore = kindnessStar.value
        
    }
    
    func reviewScoreForCurriculum(){
        
        print(curriculumStar.value)
        
        curriculumScore = curriculumStar.value
    }
    
    func reviewScoreForPreparation(){
        
        preparationScore = preparationStar.value
    }
    
    func reviewForDelivery(){
        
        deliveryScore = deliveryStar.value
    }
    
    func reviewForPunctually(){
        
        punctuallyScore = punctuallyStar.value
    }
    
    @IBAction func resignTV(_ sender: UITapGestureRecognizer) {
        
        reviewContentTextView.resignFirstResponder()
        
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

