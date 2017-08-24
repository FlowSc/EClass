//
//  DetailChangeUserInfoViewController.swift
//  TalingLoginView
//
//  Created by 김태형 on 2017. 8. 5..
//  Copyright © 2017년 김태형. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

//protocol DetailChangeUserInfoViewControllerDelegate {
//    func sendImage(data:UIImage, data1:UIImagePickerController)
//}

class DetailChangeUserInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ChangeSelfDescriptionTableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let propertyList = ["이름","닉네임" , "이메일" , "휴대전화"]
    var cell1:ChangeSelfDescriptionTableViewCell?
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0
        {
            return "유저 정보 변경"
        }else
        {
            return "이미지 변경"
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1
        {
            return 15
        }else
        {
            
            return 30
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0
        {
            return 70
        }else
        {
            return 146
        }
        
    }
    
    @IBOutlet weak var tv: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
            return 4
        }else
        {
            return 1
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1
        {
            let footerView:UIView =
            {
                
                let label:UILabel =
                {
                    let lb = UILabel()
                    lb.text = "수정 완료"
                    lb.textColor = .white
                    
                    return lb
                    
                }()
                
                
                let view = UIView()
                view.backgroundColor = UIColor(red: 255/255, green: 125/255, blue: 83/255, alpha: 1)
                view.isUserInteractionEnabled = true
                view.addSubview(label)
                label.translatesAutoresizingMaskIntoConstraints = false
                view.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
                view.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(modifyCompletion(_:)))
                view.addGestureRecognizer(tapGesture)
                
                return view
            }()
            
            return footerView
        }else
        {
            let view1:UIView =
            {
                let v1 = UIView()
                v1.frame.size = CGSize(width: 0, height: 0)

                return v1
            }()

            return view1
        }
    
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0
        {
            return 0
        }else
        {
            
            return 60
        }
    }
    
    
    func modifyCompletion(_ sender:UITapGestureRecognizer)
    {
        //        self.dismiss(animated: true, completion: nil)
        let cell0 = tv.cellForRow(at: IndexPath(row: 0, section: 0)) as! InputUserDataTableViewCell
        let cell1 = tv.cellForRow(at: IndexPath(row: 1, section: 0)) as! InputUserDataTableViewCell
        let cell2 = tv.cellForRow(at: IndexPath(row: 2, section: 0)) as! InputUserDataTableViewCell
        let cell3 = tv.cellForRow(at: IndexPath(row: 3, section: 0)) as! InputUserDataTableViewCell
        let cell4 = tv.cellForRow(at: IndexPath(row: 0, section: 1)) as! ChangeSelfDescriptionTableViewCell
        
        let image = cell4.imageOutlet.image

        
        let myParameter:[String:Any] = ["name":"\(cell0.userDataTextField.text!)","nickname":"\(cell1.userDataTextField.text!)","email":"\(cell2.userDataTextField.text!)","phone":"\(cell3.userDataTextField.text!)","my_photo":image!]
        let token:HTTPHeaders = ["Authorization":"Token " + "\(currentUserToken)"]
        
        print(myParameter)
        
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
        }, usingThreshold: UInt64.init(), to: "http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/profile/" + "\(currentUserPrimaryKey)/", method: .put, headers: token) { (result) in
            
            switch result{
            case .success(let upload,_ ,_):
                print("일단 석세스")
                print(upload.response)
                print("일단 석세스")
                
                upload.responseJSON { (response) in
                    
                    if response.result.isSuccess
                    {
                       
                        guard let data = response.value else
                        {
                            return
                        }
                        print("제이슨")
                        let realData = JSON(data)
                        currentUserData = User(with: realData)
                        print(realData)
//                        currentUserData = DataCenter.shared.realUser
                        self.navigationController?.popViewController(animated: true)
                        self.tv.reloadData()
                    }else
                    {
                        self.present( presentAlert("잘못된 양식을 입력하셨습니다.", message: "다시 확인해주세요", alertActionTitle: "확인"), animated: true, completion: nil)
                    }
                }
                
            case .failure(let encodingError):
                self.present( presentAlert("잘못된 양식을 입력하셨습니다.", message: "다시 확인해주세요", alertActionTitle: "확인"), animated: true, completion: nil)
                print(encodingError)
                print("fail인가")
                break
                
            }
            print("여긴 들어오니")
            print(result)
        
        
        }
    }
        // Do any additional setup after loading the view, typically from a nib
    
    
        
//        Alamofire.upload(multipartFormData: { (multipart) in
//            multipart.append(imageData2!, withName: "my_photo", fileName:"my_photo.png", mimeType: "image/jpeg")
////            multipart.append(<#T##fileURL: URL##URL#>, withName: <#T##String#>, fileName: <#T##String#>, mimeType: <#T##String#>)
////            multipart.append(self.imageUrl2!, withName: "my_photo")
//        },  to: "http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/profile/" + "\(currentUserPrimaryKey)/", method: .put, headers: ["Authorization":"Token " + "\(currentUserToken)"]) { (encodingResult) in
//            switch encodingResult {
//            case .success(let upload, _, _):
//                upload.response { response in
//                    print("이미지 업로드 성공")
//                    debugPrint(response)
//                    self.navigationController?.popViewController(animated: true)
//                }
//            case .failure(let encodingError):
//                print(encodingError)
//                print("이미지 업로드 실패")
//            }

//        Alamofire.upload(imageUrl2!, to: "http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/profile/" + "\(currentUserPrimaryKey)/", method: .put, headers: ["Authorization":"Token " + "\(currentUserToken)"]).responseJSON { (response) in
//            
//            print("000000")
//            print("\(response.result)")
//            print("11111")
//            if response.result.isSuccess
//            {
//                print("이미지 업로드 성공")
//                print("\(response.value)")
//            }else
//            {
//                print("이미지 업로드 실패")
//            }
//        }
        
//        Alamofire.upload(multipartFormData: { multipartFormData in
////            let imageData = UIImagePNGRepresentation(image)
//            multipartFormData.append(imageData!, withName: "my_photo", fileName: "file.png", mimeType: "image/png")
//
//            // multipartFormData.append((value.data(using: .utf8))!, withName: key)
//            
//        }, to: "http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/profile/" + "\(currentUserPrimaryKey)/", method: .put, headers: ["Authorization":"Token " + "\(currentUserToken)"],
//           encodingCompletion: { encodingResult in
//            switch encodingResult {
//            case .success(let upload, _, _):
//                upload.response { [weak self] response in
//                    guard let strongSelf = self else {
//                        return
//                    }
//                    debugPrint("RESPONSE IS:\(response)")
//                }
//            case .failure(let encodingError):
//                print("error:\(encodingError)")
//            }
//        })
//        debugPrint("request is:\(request)")
    
    

//        Alamofire.upload(multipartFormData: { (multipartFormData) in
//            multipartFormData.append(imageData2!, withName: "my_photo")
//
//        }, usingThreshold: UInt64.init(), to: "http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/profile/" + "\(currentUserPrimaryKey)/", method: .put, headers: ["Authorization":"Token " + "\(currentUserToken)"]) { (encodingResult) in
//            print("000000")
//            print("\(encodingResult)")
//            print("11111")
//            switch encodingResult {
//                
//            case .success(let upload, _, _):
//                upload.responseJSON { response in
//                    debugPrint(response)
//                    print("이미지 업로드 성공")
//                    print("이미지 업로드 실패")
//                }
//            case .failure(let encodingError):
//                print(encodingError)
//            }
//        }
//        Alamofire.upload(multipartFormData: <#T##(MultipartFormData) -> Void#>, usingThreshold: <#T##UInt64#>, with: <#T##URLRequestConvertible#>, encodingCompletion: <#T##((SessionManager.MultipartFormDataEncodingResult) -> Void)?##((SessionManager.MultipartFormDataEncodingResult) -> Void)?##(SessionManager.MultipartFormDataEncodingResult) -> Void#>)
//        Alamofire.upload(multipartFormData: <#T##(MultipartFormData) -> Void#>, with: <#T##URLRequestConvertible#>, encodingCompletion: <#T##((SessionManager.MultipartFormDataEncodingResult) -> Void)?##((SessionManager.MultipartFormDataEncodingResult) -> Void)?##(SessionManager.MultipartFormDataEncodingResult) -> Void#>)
//        
//        Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/profile/" + "\(currentUserPrimaryKey)/", method: .put, parameters: ["my_photo":baseString4], encoding: JSONEncoding.default, headers: ["Authorization":"Token " + "\(currentUserToken)"]).responseJSON { (response) in
//            print(JSON(response.result.value))
//            currentUserData = User(with: JSON(response.result.value))
//            print("~~~~~~~~~~~~~")
//            print(response.result)
//        }
        
//        Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/profile/" + "\(currentUserPrimaryKey)/", method: .put, parameters: ["name":"\(cell0.userDataTextField.text ?? "")","nickname":"\(cell1.userDataTextField.text ?? "")","email":"\(cell2.userDataTextField.text ?? "")","phone":"\(cell3.userDataTextField.text ?? "")"], encoding: JSONEncoding.default, headers: ["Authorization":"Token " + "\(currentUserToken)"]).responseJSON { (response) in
//            if response.result.isSuccess
//            {
//                print("!!!!!!!!!!!!!")
//                currentUserData = User(with: JSON(response.result.value))
//                
//                self.navigationController?.popViewController(animated: true)
//            }
//
//            print(response.result)
//        }
//        print(DataCenter.shared.realUser?.phone ?? "뭔가 안됨")
//        self.navigationController?.popViewController(animated: true)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0
        {
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! InputUserDataTableViewCell
            cell.userDataSet(propertyList[indexPath.row])
            if indexPath.row == 0
            {
                cell.userDataTextField.text = currentUserData?.name ?? ""
            }else if indexPath.row == 1
            {
                cell.userDataTextField.text = currentUserData?.nickName ?? ""
            }else if indexPath.row == 2
            {
                cell.userDataTextField.text = currentUserData?.email ?? ""
            }else
            {
                cell.userDataTextField.text = currentUserData?.phone ?? ""
            }
            cell.selectionStyle = .none
            return cell
            
        }else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChangeSelfDescriptionTableViewCell", for: indexPath) as! ChangeSelfDescriptionTableViewCell
            cell1 = cell
            cell.imageOutlet.image = profileImage ?? currentUserData?.profileImage

            cell.selectionStyle = .none
            cell.delegate = self
            
//            cell.imageOutlet.image = currentUserData?.profileImage ?? UIImage(named: "0.png")
            cell.userNameLabel.text = currentUserData?.userName ?? "guest"
            return cell
        }
        
       
        
    }
    var profileImage:UIImage?
    let picker = UIImagePickerController()
//    func imageOutletTouch() {
//        self.present(picker, animated: true, completion: nil)
//    }
    func imageOutletTouch()
    {
        self.present(picker, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    var imageUrl2:URL?

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        print("imagePick!!!!!!!!")
        print(info)
        guard let image = info["UIImagePickerControllerOriginalImage"] as? UIImage else {
            return
            
        }
        let imageUrl = info[UIImagePickerControllerReferenceURL] as? URL
        imageUrl2 = imageUrl
        print(image)
        profileImage = image
        cell1?.imageOutlet.image = image
        self.dismiss(animated: true, completion: nil)
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        tv.reloadData()
//    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//    
//        tv.reloadData()
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        tv.delegate = self
        
        
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

//extension ViewController {
//    func upload(image: UIImage,
//                progressCompletion: @escaping (_ percent: Float) -> Void,
//                completion: @escaping (_ tags: [String], _ colors: [PhotoColor]) -> Void) {
//        guard let imageData = UIImageJPEGRepresentation(image, 0.5) else {
//            print("Could not get JPEG representation of UIImage")
//            return
//        }
//    }
//}

//class APIManager: NSObject {
//    
//    class func apiMultipart(serviceName:String,parameters: [String:Any]?, completionHandler: @escaping (JSON?, NSError?) -> ()) {
//        
//        Alamofire.upload(multipartFormData: { (multipartFormData:MultipartFormData) in
//            for (key, value) in parameters! {
//                if key == "imageName" {
//                    multipartFormData.append(
//                        value as! Data,
//                        withName: key,
//                        fileName: "swift_file.jpg",
//                        mimeType: "image/jpg"
//                    )
//                } else {
//                    //Data other than image
//                    multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
//                }
//            }
//        }, usingThreshold: 1, to: serviceName, method: .put, headers: ["Authorization":"Token " + "\(currentUserToken)"]) { (encodingResult:SessionManager.MultipartFormDataEncodingResult) in
//            
//            switch encodingResult {
//            case .success(let upload, _, _):
//                upload.responseJSON { response in
//                    if response.result.error != nil {
//                        completionHandler(nil,response.result.error as NSError?)
//                        return
//                    }
//                    print(response.result.value!)
//                    if let data = response.result.value {
//                        let json = JSON(data)
//                        completionHandler(json,nil)
//                    }
//                }
//                break
//                
//            case .failure(let encodingError):
//                print(encodingError)
//                completionHandler(nil,encodingError as NSError?)
//                break
//            }
//        }
//    }
//}
