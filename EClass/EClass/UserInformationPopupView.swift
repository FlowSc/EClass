//
//  UserInformationPopupView.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 10..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit


typealias UserInformationPopupHandler = ((UserInformationPopupView) -> Void)

class UserInformationPopupView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var profileImage: UIImageView!
    private var searchLectureTouchedHandler: UserInformationPopupHandler = { (self) in }
    private var lectureListTouchedHandler: UserInformationPopupHandler = { (self) in }
    private var fAQTouchedHandler: UserInformationPopupHandler = { (self) in }
    private var requestLectureTouchedHandler: UserInformationPopupHandler = { (self) in }
    private let backgroundShadeView: UIView = UIView()
    private var movingDistance: CGFloat = UIScreen.main.bounds.width

    
    @IBOutlet weak var tv: UITableView!

    let settinNameList = ["수업 검색","수업 목록","수업 신청","FAQ"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0
        {
            return 250
            
        }else
        {
            return 44
        }
    }
    @IBOutlet weak var settingLabel: UILabel!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell0", for: indexPath)
            
            return cell
        }else
            
        {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            settingLabel.text = settinNameList[indexPath.row - 1]
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            self.dismiss()
        }else
        {
            self.dismiss()
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        tv.delegate = self
        tv.dataSource = self
    }
    
    init(frame:CGRect, searchLectureTouchedHandler: @escaping UserInformationPopupHandler, lectureListTouchedHandler: @escaping UserInformationPopupHandler, requestLectureTouchedHandler: @escaping UserInformationPopupHandler, fAQTouchedHandler: @escaping UserInformationPopupHandler) {
        super.init(frame: frame)
        loadNib()
//        tv.delegate = self
//        tv.dataSource = self
        self.backgroundShadeView.backgroundColor = UIColor.black
        self.backgroundShadeView.alpha = 0.5
//        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        self.searchLectureTouchedHandler = searchLectureTouchedHandler
        self.lectureListTouchedHandler = lectureListTouchedHandler
        self.requestLectureTouchedHandler = requestLectureTouchedHandler
        self.fAQTouchedHandler = fAQTouchedHandler
        self.movingDistance -= self.frame.origin.x
    }
    
    func popUp(on superView: UIView) {
        var rect:CGRect = superView.bounds
//        rect.origin.y += 64.0
        rect.size.width -= 128.0
        self.backgroundShadeView.frame = rect
        
        superView.addSubview(self.backgroundShadeView)
        
        self.alpha = 0.0
        self.frame.origin.y += self.movingDistance
        superView.addSubview(self) //애니메이션 전상황
        UIView.animate(withDuration: 0.4) {[unowned self] in
            self.frame.origin.y -= self.movingDistance
            self.alpha = 1.0 //애니메이션 후 상황
        }
        
    }
    private func dismiss() {
        self.endEditing(true)

        
        UIView.animate(withDuration: 0.4, animations: { [unowned self] in
            self.alpha = 0.0
            self.frame.origin.x += self.movingDistance
        }) { [unowned self] (bool) in
            self.backgroundShadeView.removeFromSuperview()
            self.removeFromSuperview()
        }
        
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    private func loadNib() {
        let viewFromNib: UIView = Bundle.main.loadNibNamed("UserInformationPopupView", owner: self, options: nil)!.first as! UIView
        viewFromNib.frame = self.bounds
        //        viewFromNib.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(viewFromNib)
    }
    

}
