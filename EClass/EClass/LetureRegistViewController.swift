//
//  LetureRegistViewController.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 20..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class LetureRegistViewController: UIViewController, UITextViewDelegate{
    
    var detailData:JSON!


    @IBOutlet weak var tutorCommentLb: UILabel!
    @IBOutlet weak var registButtonOutlet: UIButton!
    @IBOutlet weak var userCommentTfv: UITextView!
    @IBOutlet weak var tutorImageView: UIImageView!
    
    @IBAction func tapEmptySpace(_ sender: UITapGestureRecognizer) {
        
        userCommentTfv.resignFirstResponder()
    }
    override func viewDidLoad() {
        
        self.navigationItem.title = "수업신청"
        
        super.viewDidLoad()
        
        print("DETAIL")
        print(detailData)
        print("AAA")
        
        tutorImageView.kf.setImage(with: URL(string:detailData["cover_photo"].stringValue))
        tutorCommentLb.text = "안녕하세요 \(UserDefaults.standard.string(forKey: "UserName")!) 님! \n 튜터 \(detailData["tutor_info"]["nickname"].stringValue) 입니다. \n 지금부터 수업 준비를 도와드릴게요. \n 필요하신 사항은 아래 칸에 작성하셔서 신청 시 함께 보내주세요!"
        tutorCommentLb.makeCornerRound3()
        userCommentTfv.makeCornerRound3()
        userCommentTfv.delegate = self
        registButtonOutlet.backgroundColor = UIColor(red: 255/255, green: 125/255, blue: 83/255, alpha: 1)
        registButtonOutlet.setTitleColor(.white, for: .normal)

        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func lectureRegistButtonTouched(_ sender: Any) {
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
