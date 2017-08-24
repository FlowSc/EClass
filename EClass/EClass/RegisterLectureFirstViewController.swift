//
//  RegisterLectureFirstViewController.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 18..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import DKImagePickerController

//var classMakeParameter:[String:Any] = ["title":"","category":"","class_type":"","tutor_intro":"","class_intro":"","target_intro":"","price":"","basic_class_time":"","location_etc_type":"","location_etc_text":"","total_count":"","min_member":"","max_member":"","location1":"","location2":"","location_option":"custom","location_detail":"","class_weekday":"","class_time":""]
var classMakeParameter:[String:Any] = [:]

class RegisterLectureFirstViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var backImage: UIImageView!
    
    @IBOutlet weak var classType: UISegmentedControl!
    
    @IBOutlet weak var categoryTextField: UITextField!
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var registerLectureCoverImage: UIImageView!
    @IBOutlet weak var lectureTitle: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        backImage.image = UIImage(named: "register0.png")
        backImage.alpha = 0.4
        registerLectureCoverImage.backgroundColor = .white
        registerLectureCoverImage.layer.cornerRadius = 15
        
        //        goNextButtonOutlet.backgroundColor = .white
        //
        //        goNextButtonOutlet.alpha = 0.8
        registerLectureCoverImage.image = UIImage(named:"noImage.png")
        registerLectureCoverImage.alpha = 0.8
        registerLectureCoverImage.contentScaleFactor = 0.3
        registerLectureCoverImage.contentMode = .scaleAspectFit
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.alpha = 0.8

        registerLectureCoverImage.layer.cornerRadius = 5
        registerLectureCoverImage.layer.borderColor = UIColor.black.cgColor
        registerLectureCoverImage.layer.borderWidth = 0.5
        registerLectureCoverImage.clipsToBounds = true
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(registerLectureImageTouched(_:)))
        registerLectureCoverImage.isUserInteractionEnabled = true
        registerLectureCoverImage.addGestureRecognizer(tapAction)
        //        goNextButtonOutlet.layer.borderColor = UIColor.black.cgColor
        //
        ////        goNextButtonOutlet.layer.cornerRadius = 5
        ////        saveButtonOutlet.layer.cornerRadius = 5
        //        goNextButtonOutlet.layer.borderWidth = 0.5
        
        
        // Do any additional setup after loading the view.
    }
    
    func pickerLoad(){
        let picker = DKImagePickerController()
        picker.singleSelect = true
        
        picker.didSelectAssets = {[unowned self] (assets:[DKAsset]) in print("didselectAssets")
            print(assets)
            for asset in assets {
                
                asset.fetchOriginalImageWithCompleteBlock({ (image, info) in
                    guard let imageData = UIImagePNGRepresentation(image!) else {
                        return
                    }
                    let thumnail = UIImage(data: imageData)
                    self.registerLectureCoverImage.image = thumnail!
                    print(thumnail!)
                    
                })
            }
        }
        self.present(picker, animated: true, completion: nil)
        
        
    }
    func registerLectureImageTouched(_:UITapGestureRecognizer)
    {
        print("tap")
        let picker = DKImagePickerController()
        picker.singleSelect = true
        
        picker.didSelectAssets = {[unowned self] (assets:[DKAsset]) in
            print("didselectAssets")
            print(assets)
            for asset in assets {
                
                asset.fetchOriginalImageWithCompleteBlock({ (image, info) in
                    guard let imageData = UIImagePNGRepresentation(image!) else {
                        return
                    }
                    let thumnail = UIImage(data: imageData)
                    self.registerLectureCoverImage.image = thumnail!
                    print(thumnail!)
                    
                })
            }
        }
        self.present(picker, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        
        guard let image = info["UIImagePickerControllerOriginalImage"] as? UIImage else {
            return
        }
        registerLectureCoverImage.alpha = 1
        registerLectureCoverImage.image = image
        registerLectureCoverImage.contentScaleFactor = 1
        registerLectureCoverImage.contentMode = .scaleAspectFill
        self.dismiss(animated: true, completion: nil)
        
        dump(info)
    }
    var list = ["헬스&뷰티","외국어","컴퓨터","음악/미술","스포츠","전공/취업","이색취미","전체수업보기"]
    var classTypeString = ""
    var categoryString = ""
    
    
    @IBAction func goNextButtonTouched(_ sender: UIButton) {
        if classType.selectedSegmentIndex == 0
        {
            classTypeString = "onetoone"
        }else if classType.selectedSegmentIndex == 1
        {
            classTypeString = "group"
        }else
        {
            classTypeString = "oneday"
        }
        switch categoryTextField.text!{
        case "헬스&뷰티":
            categoryString = "hbn"
        case "외국어":
            categoryString = "lang"
        case "컴퓨터":
            categoryString = "com"
        case "음악/미술":
            categoryString = "mna"
        case "스포츠":
            categoryString = "sports"
        case "전공/취업":
            categoryString = "major"
        case "이색취미":
            categoryString = "hobby"
        default:
            categoryString = ""
            
        }
        classMakeParameter.updateValue(lectureTitle.text!, forKey: "title")
        classMakeParameter.updateValue(categoryString, forKey: "category")
        classMakeParameter.updateValue(classTypeString, forKey: "class_type")
        classMakeParameter.updateValue(registerLectureCoverImage.image!, forKey: "cover_photo")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == categoryTextField
        {
            categoryPicker.isHidden = false
            textField.endEditing(true)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return list[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTextField.text = list[row]
        categoryPicker.isHidden = true
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
