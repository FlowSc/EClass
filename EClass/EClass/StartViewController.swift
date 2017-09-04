//
//  StartViewController.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 9. 4..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/regiclass/class/list/", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if response.result.isSuccess {
                guard let data = response.result.value else{return}
                
                let lectureData = JSON(data)
                
                LectureList.lectureList = lectureData
                
                let stb = UIStoryboard.init(name: "Main2", bundle: nil)
                
                let mvc = stb.instantiateViewController(withIdentifier: "loginViewCon")
                
                self.navigationController?.pushViewController(mvc, animated: true)
                
            }else{
                print("AAAA")
            }
            
        }

        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadLecture(){
        
        Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/regiclass/class/list/", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            guard let data = response.result.value else{return}
            
            let lectureData = JSON(data)
            
            LectureList.lectureList = lectureData
            
            
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

}
