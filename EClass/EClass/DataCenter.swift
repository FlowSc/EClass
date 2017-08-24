//
//  DataCenter.swift
//  EducationProject
//
//  Created by 김태형 on 2017. 7. 27..
//  Copyright © 2017년 김태형. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension UIImageView
{
    func borderColorBlack()
    {
        return self.layer.borderColor = UIColor.black.cgColor
    }
}


//전역 변수 & 함수

//유저 primaryKey 회원 가입 시 +1 됨
var currentUserPrimaryKey:Int = 0
var currentUserToken:String = ""
var currentUserTuTorPK:Int = 0

//각종 알람

func presentAlert(_ title:String, message:String, alertActionTitle:String) -> UIAlertController
{
    let alertController = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    let alertAction = UIAlertAction.init(title: alertActionTitle, style: UIAlertActionStyle.cancel, handler: nil)
    
    alertController.addAction(alertAction)
    
    return alertController
//    
//    self.present(alertController, animated: true, completion: nil)
}

//JSON([String:Any]) Post 함수
func postDicToUserInfo(params:[String:String])
    
{

    Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/signup/", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
        
        let result = JSON(response.value!)
        
        let userToken = result["token"].stringValue
        let userName = result["user"]["username"].stringValue
        let userPk = result["user"]["user_pk"].intValue
        let userNickname = result["user"]["nickname"].stringValue
        
        
        UserDefaults.standard.set(userToken, forKey: "UserToken")
        UserDefaults.standard.set(userName, forKey: "UserName")
        UserDefaults.standard.set(userPk, forKey: "UserPK")
        UserDefaults.standard.set(userNickname, forKey: "UserNickname")

        print("여기서부터")
        print(response)
        print("~~~~~~~~")
        print(response.result.value!)
        print("~~~~~~~~")
        print(response.data!)
        print("~~~~~~~~")
        print(response.description)
        print("~~~~~~~~")
        print(response.value!)
        print(params)
        print(response.error!)
    
    }
}

func postDicToReviewList(params:[String:Any])
{
    Alamofire.request("http://localhost:1337/User", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
        print(response)
    }
}

func checkUserInfo(params:[String:String])
{
    Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/login/", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
        guard let data = response.result.value else
        {
            return
        }
        let jsonData = JSON(data)
        print(jsonData)
        if params["username"] == jsonData["user"]["username"].stringValue
        {
            
//            let mainStoryBoard = UIStoryboard(name: "MainPage", bundle: nil)
//            let pushMainView = mainStoryBoard.instantiateViewController(withIdentifier: "reveal1")
//            self.present(pushMainView, animated: true, completion: nil)
//            let mainStoryBoard2 = UIStoryboard(name: "Main2", bundle: nil)
//            let pushMainView2 = mainStoryBoard2.instantiateViewController(withIdentifier: "DetailLogInViewController") as! DetailLogInViewController
            
            print("same")
            loginSuccess = true
            print("samesame")
            
            
            
        }
    }
}

func postDicToLectureInfo(params:[String:Any])
{
    Alamofire.request("http://localhost:1337/User", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
        print(response)
    }
}


final class DataCenter
{
//    var realReviewList:[ReviewList] = []
//    var realLectures:[Lecture] = []
    var realUser:User?
    static let shared = DataCenter()
    
    private init()
    {
//유저 정보 GET
        
        Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/profile/" + "\(currentUserPrimaryKey)/", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization":"Token " + "\(currentUserToken)"]).responseJSON { (response) in
            guard let data = response.result.value else
            {
                return
            }
            let jsonData = JSON(data)
            
            self.realUser = User(with: jsonData)
        }
//        Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/member/profile/" + "\(currentUserPrimaryKey)/").responseJSON { (response) in
//            
//            guard let data = response.result.value else
//            {
//                return
//            }
//            let jsonData = JSON(data)
//
//            self.realUser = User(with: jsonData)
//        }
    }
    
//강의 정보 GET
//        Alamofire.request("http://localhost/1338").responseJSON { (response) in
//            guard let data = response.result.value else
//            {
//                return
//            }
//            let jsonData = JSON(data)
//            for _ in jsonData
//            {
//                self.realLectures.append(Lecture(with: jsonData))
//            }
//        }
//// ReviewList GET
//        Alamofire.request("http://localhost/1338").responseJSON { (response) in
//            guard let data = response.result.value else
//            {
//                return
//            }
//            let jsonData = JSON(data)
//            for _ in jsonData
//            {
//                self.realReviewList.append(ReviewList(with: jsonData))
//            }
}

struct LectureList {
    static var lectureList:JSON!
}
// 강의 정보
struct Lecture {
    
    var name:String
    var desciption:String
    var category:String
    var region:String
    var reviews:[String]?
    var score:Int?
    

    init(with json:JSON)
    {
        name = json["name"].stringValue
        desciption = json["description"].stringValue
        category = json["category"].stringValue
        region = json["region"].stringValue
        
// 리뷰 리스트
        reviews = json["reviews"].arrayValue.map({ (json) -> String in
            return String(describing: json)
        })
        
// 강의 별점 평균은 서버에서 내 준다 길래 일단 있다고 보고 int값 받음.
        score = json["score"].intValue
    }
}

// 유저 정보
struct User
{
    var userName:String
    var nickName:String?
    var password:String?
    var email:String?
    var name:String?
    var phone:String?
//    var tutorPK:String?
    var profileImage:UIImage?
    var studiedLecture:[Lecture]?
    var selectedLecture:[Lecture]?
    var wishedLecture:[Lecture]?
    var selfDescription:String?
    var tutorAuthorize:Bool = false
    var registeredLecture:[Lecture]?
    var careerDescription:String?

    var token:String?

    init(with json:JSON)
    {
        userName = json["username"].stringValue
        nickName = json["nickname"].stringValue
        email = json["email"].stringValue
        password = json["password"].stringValue
        name = json["name"].stringValue
        phone = json["phone"].stringValue
        
//profileImage 바로 uiImage로 바꿔줌 감사해해라
        if let url = URL(string: json["my_photo"].stringValue)
        {
            do {
                let data = try Data(contentsOf: url)
                profileImage = UIImage(data: data)
            } catch {
                print("can`t downLoad profileImage")
            }
            
        }
// 수강했던 목록
        studiedLecture = json["studiedLecture"].arrayValue.map({ (json) -> Lecture in
            return Lecture(with: json)
        })
        
// 현재 수강 신청한 목록
        selectedLecture = json["seletecLecture"].arrayValue.map({ (json) -> Lecture in
            return Lecture(with: json)
        })
        
// 찜한 목록
        wishedLecture = json["wishedLecture"].arrayValue.map({ (json) -> Lecture in
            return Lecture(with: json)
        })
        
// 자기 소개
        selfDescription = json["selfDescription"].stringValue
        
// 튜터 권한 default 는 false
        tutorAuthorize = json["tutorAuthorize"].bool ?? false
        
// 개설한 강의(튜터 전용)
        registeredLecture = json["registeredLecture"].arrayValue.map({ (json) -> Lecture in
        return Lecture(with:json) })
        
// 경력 소개(튜터 전용)
        careerDescription = json["careerDescription"].stringValue
        
    }
}

struct ReviewList {
    var description:String?
    
    init(with json:JSON) {
        description = json["description"].stringValue
    }
}

extension UIView {
    
    func makeCircle(){
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 25
        self.backgroundColor = .black
        self.clipsToBounds = true
    }
    
    func makeCornerRound3() {

        self.layer.cornerRadius = 3
    }
    
    func setBasicColor(){
        self.backgroundColor = UIColor(red: 255/255, green: 125/255, blue: 83/255, alpha: 1)
    }
    
}

extension UIButton {
    
    override func setBasicColor(){
        
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = UIColor(red: 255/255, green: 125/255, blue: 83/255, alpha: 1)
        self.layer.cornerRadius = 3
    }

    
}

extension Double { /// Rounds the double to decimal places value 
    
    mutating func roundToPlaces(places:Int) -> Double { let divisor = pow(10.0, Double(places))
        
        return Darwin.round(self * divisor) / divisor }

}

extension UIImage {
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

func reloadList(){
    
    Alamofire.request("http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/regiclass/class/list/", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
        guard let data = response.result.value else{return}
        
        let lectureData = JSON(data)
        
        LectureList.lectureList = lectureData
    }
}




