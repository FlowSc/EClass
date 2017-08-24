//
//  RegisterLectureThirdViewController.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 18..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class RegisterLectureThirdViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var locationPick: UIPickerView!
    @IBOutlet weak var locationEtcText: UITextField!
    @IBOutlet weak var locationEtcType: UITextField!
    @IBOutlet weak var totalCount: UITextField!
    @IBOutlet weak var basicClassTime: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var backImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        minPicker.isHidden = true
        maxPicker.isHidden = true
        locationPick.isHidden = true
        set()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var maxMember: UITextField!
    @IBOutlet weak var minMember: UITextField!
    @IBOutlet weak var maxPicker: UIPickerView!
    @IBOutlet weak var minPicker: UIPickerView!
    var list = ["1","2","3","4","5","6","7","8","9"]

    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == minMember
        {
            minPicker.isHidden = false
            textField.endEditing(true)
        }else if textField == maxMember
        {
            maxPicker.isHidden = false
            textField.endEditing(true)
        }else if textField == locationEtcType
        {
            locationPick.isHidden = false
            textField.endEditing(true)
        }
    }
    
    func set()
    {
        backImage.image = UIImage(named: "register2.png")
        backImage.alpha = 0.3
    }
    var list1 = ["yes","no"]
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == locationPick
        {
            return list1.count
        }else
        {
            return list.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        if pickerView == locationPick
        {
            return list1[row]
        }else
        {
            return list[row]
        }
        
    }
    @IBAction func goNextButtonTouched(_ sender: UIButton) {
        classMakeParameter.updateValue(price.text!, forKey: "price")
        classMakeParameter.updateValue(basicClassTime.text!, forKey: "basic_class_time")
        classMakeParameter.updateValue(locationEtcType.text!, forKey: "location_etc_type")
        classMakeParameter.updateValue(locationEtcText.text!, forKey: "location_etc_text")
        classMakeParameter.updateValue(totalCount.text!, forKey: "total_count")
        classMakeParameter.updateValue(minMember.text!, forKey: "min_member")
        classMakeParameter.updateValue(maxMember.text!, forKey: "max_member")
        
        
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == minPicker
        {
            minMember.text = list[row]
        }else if pickerView == maxPicker
        {
            maxMember.text = list[row]
        }else
        {
            locationEtcType.text = list1[row]
        }
        
        pickerView.isHidden = true
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
