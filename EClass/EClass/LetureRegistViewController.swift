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
import Alamofire


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
        
        print("CCCCCC")
        print("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/regiclass/lecture/register/\(detailData["id"].intValue)")
        print("XXXXXX")
        
        
            
            let ac = UIAlertController.init(title: "수강신청", message: "수강신청하시겠어요?", preferredStyle: .alert)
            let okAction = UIAlertAction.init(title: "넵!", style: .default, handler: { (action) in
                print(action)
                
                Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/regiclass/lecture/register/\(self.detailData["id"].intValue)/", method: .post, parameters: ["to_tutor":self.userCommentTfv.text!], encoding: JSONEncoding.default, headers: ["Authorization":"Token \(UserDefaults.standard.string(forKey: "UserToken")!)"]).responseJSON { (result) in
                    print("-------")
                    print(result)
                    print(result.result.value)
                    print("-------")
                    
                }
                let doneAlert = UIAlertController.init(title: "신청이 완료되었습니다", message: "나의 강의목록에서 확인해보세요!", preferredStyle: .alert)
                let doneAction = UIAlertAction.init(title: "돌아가기", style: .default, handler: { (go) in
                    self.navigationController?.popViewController(animated: true)
                })
                doneAlert.addAction(doneAction)
                self.present(doneAlert, animated: true, completion: nil)
                
            })
            let cancelAction = UIAlertAction.init(title: "다시 생각해볼게요", style: .cancel
                , handler: nil)
            
            ac.addAction(okAction)
            ac.addAction(cancelAction)
            
            self.present(ac, animated: true, completion: nil)
            
            

        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    

