//
//  RegisterLectureSecondViewController.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 18..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class RegisterLectureSecondViewController: UIViewController, UITextViewDelegate {

//    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
//        if textView.tag == 1
//        {
//            self.view.frame.origin.y -= 10
//        }else if textView.tag == 2
//        {
//             self.view.frame.origin.y -= 10
//        }
//        return true
//    }
//    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
//        if textView.tag == 1
//        {
//            self.view.frame.origin.y += 10
//        }else if textView.tag == 2
//        {
//            self.view.frame.origin.y += 10
//            textView.resignFirstResponder()
//        }
//        return true
//    }
    @IBOutlet weak var backImage: UIImageView!

    @IBOutlet weak var lectureStudentTextView: UITextView!
    @IBOutlet weak var introduceLectureTextView: UITextView!
    @IBOutlet weak var introduceTutorTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        set()
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
        lectureStudentTextView.resignFirstResponder()
        introduceLectureTextView.resignFirstResponder()
        introduceTutorTextView.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    func set()
    {
        backImage.image = UIImage(named: "register1.png")
        backImage.alpha = 0.3

        self.navigationController?.navigationBar.alpha = 0.5
        introduceLectureTextView.delegate = self
        introduceTutorTextView.delegate = self
        lectureStudentTextView.delegate = self

        introduceTutorTextView.layer.cornerRadius = 5
        introduceLectureTextView.layer.cornerRadius = 5
        lectureStudentTextView.layer.cornerRadius = 5
        
        
        
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == introduceTutorTextView
        {
            if textView.text == "자신을 소개해 주세요!"
            {
                textView.alpha = 1
                textView.text = ""
                self.view.frame.origin.y -= 10
            }
        }else if textView == introduceLectureTextView
        {
            if textView.text == "어떤 수업인지 소개해주세요!"
            {
                textView.alpha = 1
                textView.text = ""
                self.view.frame.origin.y -= 10
            }
        }else
        {
            if textView.text == "어떤 수강생을 대상으로 하는 지 소개해주세요!"
            {
                textView.alpha = 1
                textView.text = ""
                self.view.frame.origin.y -= 10
            }
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == introduceTutorTextView
        {
            if textView.text == ""
            {
                textView.alpha = 0.5
                textView.text = "자신을 소개해 주세요!"
                self.view.frame.origin.y += 10
            }
        }else if textView == introduceLectureTextView
        {
            if textView.text == ""
            {
                textView.alpha = 0.5
                textView.text = "어떤 수업인지 소개해주세요!"
                self.view.frame.origin.y += 10
            }
        }else
        {
            if textView.text == ""
            {
                textView.alpha = 0.5
                textView.text = "어떤 수강생을 대상으로 하는 지 소개해주세요!"
                self.view.frame.origin.y += 10
            }
        }
    }

    @IBAction func goGo(_ sender: UIBarButtonItem) {
        classMakeParameter.updateValue(introduceTutorTextView.text, forKey: "tutor_intro")
        classMakeParameter.updateValue(introduceLectureTextView.text, forKey: "class_intro")
        classMakeParameter.updateValue(lectureStudentTextView.text, forKey: "target_intro")
//        self.view.endEditing(true)
//        self.view.resignFirstResponder()
        let storyBoard1 = UIStoryboard(name: "RegisterLecture", bundle: nil)
        let nextVC = storyBoard1.instantiateViewController(withIdentifier: "RegisterLectureThirdViewController") as! RegisterLectureThirdViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
        print("2")

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
