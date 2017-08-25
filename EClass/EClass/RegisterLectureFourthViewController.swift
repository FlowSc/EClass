//
//  RegisterLectureFourthViewController.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 18..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class RegisterLectureFourthViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate {


    @IBAction func doneButtonTouched(_ sender: UIBarButtonItem) {
        classMakeParameter.updateValue("custom", forKey: "location_option")
        classMakeParameter.updateValue(location1.text!, forKey: "location1")
        classMakeParameter.updateValue(location2.text!, forKey: "location2")
        classMakeParameter.updateValue(locationDetail.text!, forKey: "location_detail")
        classMakeParameter.updateValue(classWeekday.text!, forKey: "class_weekday")
        classMakeParameter.updateValue(classTime.text!, forKey: "class_time")
        print(classMakeParameter)
        self.view.endEditing(true)
        self.view.resignFirstResponder()
        print("4")
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
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        // Do any additional setup after loading the view.
    }
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= 40
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += 40
            }
        }
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
