//
//  RegisterLectureSecondViewController.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 18..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class RegisterLectureSecondViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var goNextButtonOutlet: UIButton!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    @IBOutlet weak var lectureStudentTextView: UITextView!
    @IBOutlet weak var introduceLectureTextView: UITextView!
    @IBOutlet weak var introduceTutorTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        set()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func set()
    {
        goNextButtonOutlet.layer.borderColor = UIColor.black.cgColor
        saveButtonOutlet.layer.borderColor = UIColor.black.cgColor
        goNextButtonOutlet.layer.borderWidth = 0.5
        saveButtonOutlet.layer.borderWidth = 0.5
        
        introduceLectureTextView.delegate = self
        introduceTutorTextView.delegate = self
        lectureStudentTextView.delegate = self
        introduceTutorTextView.layer.borderColor = UIColor.black.cgColor
        introduceLectureTextView.layer.borderColor = UIColor.black.cgColor
        lectureStudentTextView.layer.borderColor = UIColor.black.cgColor
        introduceTutorTextView.layer.borderWidth = 0.5
        introduceLectureTextView.layer.borderWidth = 0.5
        lectureStudentTextView.layer.borderWidth = 0.5
        introduceTutorTextView.layer.cornerRadius = 5
        introduceLectureTextView.layer.cornerRadius = 5
        lectureStudentTextView.layer.cornerRadius = 5
        introduceLectureTextView.alpha = 0.5
        introduceTutorTextView.alpha = 0.5
        lectureStudentTextView.alpha = 0.5
        
        
        
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView == introduceTutorTextView
        {
            if textView.text == "자신을 소개해 주세요!"
            {
                textView.alpha = 1
                textView.text = ""
            }
        }else if textView == introduceLectureTextView
        {
            if textView.text == "어떤 수업인지 소개해주세요!"
            {
                textView.alpha = 1
                textView.text = ""
            }
        }else
        {
            if textView.text == "어떤 수강생을 대상으로 하는 지 소개해주세요!"
            {
                textView.alpha = 1
                textView.text = ""
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
            }
        }else if textView == introduceLectureTextView
        {
            if textView.text == ""
            {
                textView.alpha = 0.5
                textView.text = "어떤 수업인지 소개해주세요!"
            }
        }else
        {
            if textView.text == ""
            {
                textView.alpha = 0.5
                textView.text = "어떤 수강생을 대상으로 하는 지 소개해주세요!"
            }
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
