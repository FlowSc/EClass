//
//  ReviewAddViewController.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 14..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class ReviewAddViewController: UIViewController {
    @IBOutlet weak var reviewContentTextView: UITextView!

    @IBOutlet weak var registButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        registButton.backgroundColor = UIColor(red: 255/255, green: 125/255, blue: 83/255, alpha: 1)

        
        // Do any additional setup after loading the view.
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