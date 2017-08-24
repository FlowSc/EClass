//
//  ChangeSelfDescriptionTableViewCell.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 19..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

protocol ChangeSelfDescriptionTableViewDelegate {
    func imageOutletTouch()
}


class ChangeSelfDescriptionTableViewCell: UITableViewCell{

//    var detailChangeViewController:((DetailChangeUserInfoViewController) -> Void) = {(self) in }
    var delegate:ChangeSelfDescriptionTableViewDelegate?
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var imageOutlet: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        outletSet()
        print("awakeFromNib")
        imageOutlet.image = currentUserData?.profileImage

        imageOutlet.isUserInteractionEnabled = true // 이거 해야 터치 먹음!!!!!!!!!
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageOutletTouched(_:)))
        imageOutlet.addGestureRecognizer(tapGesture)
        // Initialization code
    }

    func imageOutletTouched(_ data:UITapGestureRecognizer)
    {

        delegate?.imageOutletTouch()
    }

    func outletSet()
    {
        imageOutlet.layer.borderColor = UIColor.black.cgColor
        imageOutlet.layer.borderWidth = 0.5
        imageOutlet.layer.cornerRadius = 32
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
