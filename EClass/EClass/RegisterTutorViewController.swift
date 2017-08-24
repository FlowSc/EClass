//
//  RegisterTutorViewController.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 23..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import SwiftyJSON
import Photos

class RegisterTutorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RegisterTutorTableViewCell2Delegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, RegisterTutorTableViewCell3Delegate {
    
    var textFields:[UITextField]? = []
   
    @IBAction func registerTutorButtonTouched(_ sender: UIBarButtonItem) {
        registTutor()
//        print(textFields?[3].text)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0
        {
            return "정보 등록"
        }else if section == 1
        {
            return "프로필 사진"
        }else
        {
            return "자격증 사진"
        }
    }
    var realCell:RegisterTutorTableViewCell2?
    var realCell1:RegisterTutorTableViewCell3?
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print("pick")
        guard let image = info["UIImagePickerControllerOriginalImage"] as? UIImage else {
            return
        }
        
        if UserDefaults.standard.integer(forKey: "registerTutor") == 1
        {
            
            realCell?.imageOutlet.image = image
        }else
        {
            realCell1?.imageOutlet.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var tv: UITableView!
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func imageOutletTouched2() {
        UserDefaults.standard.set(2, forKey: "registerTutor")
        self.present(picker, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0
        {
            return 60
            
        }else if indexPath.section == 1
        {
            return 150
        }else
        {
            return 200
        }
    }
    let picker = UIImagePickerController()
    func imageOutletTouched() {
        
        UserDefaults.standard.set(1, forKey: "registerTutor")
        self.present(picker, animated: true, completion: nil)

    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! RegisterTutorTableViewCell1
            textFields?.append(cell.inputTextField)
            cell.set(indexPath.row)
            cell.selectionStyle = .none
            return cell
        }else if indexPath.section == 1
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! RegisterTutorTableViewCell2
            cell.delegate = self
            
            cell.selectionStyle = .none
            realCell = cell
            return cell
        }else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! RegisterTutorTableViewCell3
            cell.delegate = self
            cell.selectionStyle = .none
            realCell1 = cell
            return cell
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0
        {
            return 7
        }else
        {
            return 1
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.tableFooterView = UIView(frame: CGRect.zero)
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        picker.delegate = self
        tv.bounces = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registTutor(){
        
        let token:HTTPHeaders = ["Authorization":"Token " + currentUserToken]
        print("Token " + currentUserToken)
        
        print(realCell?.imageOutlet.image)
        print(realCell1?.imageOutlet.image)
        
        let myParameter = ["my_photo":realCell!.imageOutlet.image!, "phone":textFields![0].text!,"nickname":textFields![1].text!,"cert_type":textFields![2].text!, "school":textFields![3].text!, "major":textFields![4].text!,  "status_type":textFields![5].text!,"cert_name":textFields![6].text!,"cert_photo":realCell1!.imageOutlet.image!] as [String:Any]
        
        for i in textFields!
        {
            print(i.text)
        }
        
        Alamofire.upload(multipartFormData: { (data) in
            for (key, value) in myParameter {
                if value is String || value is Int {
                    data.append("\(value)".data(using: .utf8)!, withName: key)
                    print(data)
                    print(key, value)
                }
                if value is UIImage {
                    data.append(UIImagePNGRepresentation(value as! UIImage)!, withName: key, fileName: "profile", mimeType: "image/png")
                }
            }
        }, usingThreshold: UInt64.init(), to: "http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/tutor/register/", method: .post, headers: token) { (result) in
            
            print(result)
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
//        Alamofire.upload(multipartFormData: { (data) in
//            for (key, value) in myParameter {
//                if value is String || value is Int {
//                    data.append("\(value)".data(using: .utf8)!, withName: key)
//                    print(data)
//                    print(key, value)
//                }
//                if value is UIImage {
//                    data.append(UIImagePNGRepresentation(value as! UIImage)!, withName: key, fileName: "profile", mimeType: "image/png")
//                }
//            }
//        }, usingThreshold: UInt64.init(), to: "http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/tutor/register/", method: .post, headers: token){ (result) in
//            switch result{
//            case .success(let upload,_ ,_):
//                print("일단 석세스")
//                print(upload.response)
//                print("일단 석세스")
        
        
        
        
        
        
                
//                upload.responseJSON { response in
//                    
//                    print("여긴 들어오니")
//                    
//                    let params = ["username":UserDefaults.standard.object(forKey: "UserName") as! String,"password":UserDefaults.standard.object(forKey: "UserPassword") as! String]
//                    Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/login/", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
//                        guard let data = response.result.value else
//                        {
//                            return
//                        }
//                        print("제이슨")
//                        let realData = JSON(data)
//                        print(realData)
//                        print("제이슨")
//                        currentUserPrimaryKey = realData["user"]["user_pk"].intValue
//                        currentUserToken = realData["token"].stringValue
//                        currentUserTuTorPK = realData["user"]["tutor_pk"].intValue
//                        
//                        
//                        if response.result.isSuccess
//                        {
//                            print("재로그인")
//                            print(response.result.value!)
//                            self.dismiss(animated: true, completion: nil)
//                            print("재로그인")
//                        }
//                    }
//                    print("튜터 등록")
//    
//                    //                        self.dismiss(animated: true, completion: nil)
//
//                    
//                }
                
//            case .failure(let encodingError):
//                print(encodingError)
//                print("fail인가")
//                break
//            }

//            print(result)
    
        // Do any additional setup after loading the view, typically from a nib.


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
