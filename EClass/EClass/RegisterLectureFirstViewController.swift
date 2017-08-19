//
//  RegisterLectureFirstViewController.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 18..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class RegisterLectureFirstViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    let picker = UIImagePickerController()

    @IBOutlet weak var goNextButtonOutlet: UIButton!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    @IBOutlet weak var categoryTextField: UITextField!

    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var registerLectureCoverImage: UIImageView!
    @IBOutlet weak var lectureTitleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        picker.delegate = self
        registerLectureCoverImage.layer.cornerRadius = 5
        registerLectureCoverImage.layer.borderColor = UIColor.black.cgColor
        registerLectureCoverImage.layer.borderWidth = 0.5
        registerLectureCoverImage.clipsToBounds = true
        let tapAction = UITapGestureRecognizer(target: self, action: #selector(registerLectureImageTouched(_:)))
        registerLectureCoverImage.isUserInteractionEnabled = true
        registerLectureCoverImage.addGestureRecognizer(tapAction)
        goNextButtonOutlet.layer.borderColor = UIColor.black.cgColor
        saveButtonOutlet.layer.borderColor = UIColor.black.cgColor
//        goNextButtonOutlet.layer.cornerRadius = 5
//        saveButtonOutlet.layer.cornerRadius = 5
        goNextButtonOutlet.layer.borderWidth = 0.5
        saveButtonOutlet.layer.borderWidth = 0.5

        // Do any additional setup after loading the view.
    }
    func registerLectureImageTouched(_:UITapGestureRecognizer)
    {
        print("tap")
        present(picker, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
//        registerLectureCoverImage.image = UIImage(contentsOfFile: info["UIImagePickerControllerReferenceURL"] as! String)
//        registerLectureCoverImage.image = UIImage(data: info["UIImagePickerControllerReferenceURL"] as! Data)
        guard let image = info["UIImagePickerControllerOriginalImage"] as? UIImage else {
            return
        }
        registerLectureCoverImage.image = image
        self.dismiss(animated: true, completion: nil)
        
        dump(info)
    }
    var list = ["헬스&뷰티","외국어","컴퓨터","음악/미술","스포츠","전공/취업","이색취미","전체수업보기"]

    @IBOutlet weak var goNextPageButtonTouched: UIButton!
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
