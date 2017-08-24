//
//  RegisterLectureFourthViewController.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 18..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class RegisterLectureFourthViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate {


    @IBAction func doneButtonTouched(_ sender: UIButton) {
        
        let myToken = UserDefaults.standard.string(forKey: "UserToken")!
        
        print("TOKEN")
        
        print(myToken)
        
        print("~~~~")
        
        let token:HTTPHeaders = ["Authorization":"Token \(myToken)"]

        classMakeParameter.updateValue("custom", forKey: "location_option")
        classMakeParameter.updateValue(location1.text!, forKey: "location1")
        classMakeParameter.updateValue(location2.text!, forKey: "location2")
        classMakeParameter.updateValue(locationDetail.text!, forKey: "location_detail")
        classMakeParameter.updateValue(classWeekday.text!, forKey: "class_weekday")
        classMakeParameter.updateValue(classTime.text!, forKey: "class_time")
        print("MYPARAMETER")
        print(classMakeParameter)
        print("~~~~~~~~")
        
        Alamofire.upload(multipartFormData: { (data) in
            for (key, value) in classMakeParameter {
                if value is String || value is Int {
                    data.append("\(value)".data(using: .utf8)!, withName: key)
                    print(data)
                    print(key, value)
                }
                
                if key == "lecture_photo" {
                    
                    var lecturePhotoArray = value as! Array<UIImage>
                    for image in lecturePhotoArray {
                        
                        print("imageNAME")
                        print(String(describing: image))
                        print("_____")
                        data.append(UIImagePNGRepresentation(image.resized(withPercentage: 0.5)!)!, withName: key, fileName: "\(String(describing: image))", mimeType: "image/png")
                        
                    }
                }
                if key == "cover_photo" {
                    
                    var coverImage:UIImage = value as! UIImage
                    
                    data.append(UIImagePNGRepresentation(coverImage.resized(withPercentage: 0.1)!)!, withName: key, fileName: "coverPhoto", mimeType: "image/png")
                }
            }
        }, usingThreshold: UInt64.init(), to: "http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/regiclass/class/make/", method: .post, headers: token) { (result) in
            
            print(result)
            reloadList()
            
            let stb = UIStoryboard.init(name: "MainPage", bundle: nil)
            let mvc = stb.instantiateViewController(withIdentifier: "reveal1")
            self.present(mvc, animated: true, completion: nil)
            
        }
        

    }
    @IBOutlet weak var classTime: UITextField!
    @IBOutlet weak var classWeekday: UITextField!
    @IBOutlet weak var locationDetail: UITextField!
    @IBOutlet weak var location2: UITextField!
    @IBOutlet weak var location1: UITextField!
    @IBOutlet weak var backImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        set()
        weekdayPicker.isHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func set()
    {
        backImage.image = UIImage(named: "register3.jpg")
        backImage.alpha = 0.3
    }

    
    @IBOutlet weak var weekdayPicker: UIPickerView!
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == classWeekday
        {
            weekdayPicker.isHidden = false
            textField.endEditing(true)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    var list = ["mon","tue","wed","thu","fri","sat","sun"]
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return list[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        classWeekday.text = list[row]
        weekdayPicker.isHidden = true
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
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
