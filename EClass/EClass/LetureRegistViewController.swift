//
//  LetureRegistViewController.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 20..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import SwiftyJSON

class LetureRegistViewController: UIViewController {
    
    var detailData:JSON!

    @IBOutlet weak var tutorCommentLb: UILabel!
    @IBOutlet weak var registButtonOutlet: UIButton!
    @IBOutlet weak var userCommentTfv: UITextView!
    @IBOutlet weak var tutorImageView: UIImageView!
    
    override func viewDidLoad() {
        
        self.navigationItem.title = "수업신청"
        
        super.viewDidLoad()
        
        print("DETAIL")
        print(detailData)
        print("AAA")
        
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
