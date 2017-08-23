//
//  MakeClassViewController.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 24..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MakeClassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func makeClass(){
        
        
        let myParameter = ["title":"축구/기본기부터 아마추어 축구 에이스까지!~!","category":"sports", "class_type":"group", "min_member":"3", "max_member":"8", "cover_photo":#imageLiteral(resourceName: "maxresdefault.jpg"), "tutor_intro":"고려대학교 체육교육과\n\n\n<경력 및 이력>\n\n고려대학교 체육교육과 졸업\n\n아마추어 축구대회 경력\n\n2007년 U리그 우승\n2008년 스포츠 토토컵 우승\n2013년 포포투 대학 동아리 전국대회 우승\n그 외 각종 교내 대회 및 전국 대회 우승 및 준우승 경력 다수(10회 이상)\n\n* 스페셜 올림픽 한국 국가대표팀 주장\n- 동아시아 지역 대회 준우승\n\n * KFA D급 지도자 자격증 취득* \n UEFA B급 지도자 자격증 취득 프로그램 참가\n\n<장점>\n\n원래 축구를 잘했다기보다는 체계적인 노력으로 실력이 많이 성장한 케이스라, 기초부터 다지고 싶은 분들의 마음을 잘 이해하고 맞춰줄 수 있을 것 같아요! \n수업 내용은 알차게 준비하되 분위기는 편하게 잘 이끌어나갈 수 있을 것 같아요~ \n축구 실력 향상도 중요하지만 그 과정을 즐기는 것도 중요하니! \n즐거운 수업 만들 수 있을 것 같습니다 ㅎㅎ", "class_intro":"1. 기본기 향상 세션\n- 볼터치, 패스, 킥, 슛 등 기본 자세 점검 후 교정\n\n2. 응용 기술 습득\n- 실제 경기 상황에서 유용하게 사용할 수 있는 기술 교육\n\n3. 포지션 이해도 증가- 공을 가지고 있을 때 각 포지션 별로 공을 어떻게 처리해야 하는지\n- 팀원 활용 방안\n- 오프 더 볼일 때 어떤 움직임을 가져야 하는지\n\n4. 전술 교육\n- 전체적으로 경기를 어떻게 운영해야 하는지\n- 상황에 따른 전술 적용 방법 전달", "target_intro":"축구를 잘하고 싶으신분!", "price":"20,000", "lecture_photo":[#imageLiteral(resourceName: "maxresdefault.jpg"), #imageLiteral(resourceName: "maxresdefault.jpg")], "basic_class_time":"3","total_count":"0", "region_comment":"축구하러오세용", "location1":"서울", "location2":"협의후결정", "location_option":"custom", "location_detail":"협의후결정", "location_etc_type":"no", "location_etc_text":"no", "class_weekday":"wed", "class_time":"16-18", "notice":"지각하시면 안됩니다!"] as [String : Any]
        
        
        let token:HTTPHeaders = ["Authorization":"Token 882de4724bd428f2d4fda81fbf9dae1bab07747c"]
        
        
        Alamofire.upload(multipartFormData: { (data) in
            for (key, value) in myParameter {
                if value is String || value is Int {
                    data.append("\(value)".data(using: .utf8)!, withName: key)
                    print(data)
                    print(key, value)
                }
                
                if key == "lecture_photo" {
                    for image in value as! Array<UIImage> {
                        
                        data.append(UIImagePNGRepresentation(image)!, withName: key, fileName: "lecture_photo", mimeType: "image/png")
                        
                    }
                }
                if value is UIImage {
                    data.append(UIImagePNGRepresentation(value as! UIImage)!, withName: key, fileName: "coverPhoto", mimeType: "image/png")
                }
            }
        }, usingThreshold: UInt64.init(), to: "http://eb-yykdev-taling-dev.ap-northeast-2.elasticbeanstalk.com/regiclass/class/make/", method: .post, headers: token) { (result) in
            
            print(result)
            
        }
        
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
