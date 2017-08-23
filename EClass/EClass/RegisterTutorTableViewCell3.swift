//
//  RegisterTutorTableViewCell3.swift
//  EClass
//
//  Created by 김태형 on 2017. 8. 23..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

protocol RegisterTutorTableViewCell3Delegate {
    func imageOutletTouched2()
}

class RegisterTutorTableViewCell3: UITableViewCell {
    
    var delegate:RegisterTutorTableViewCell3Delegate?
    @IBOutlet weak var imageOutlet: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageOutlet.layer.borderColor = UIColor.black.cgColor
        imageOutlet.layer.borderWidth = 1
        imageOutlet.layer.cornerRadius = 10
        imageOutlet.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touch(_:)))
        imageOutlet.addGestureRecognizer(tapGesture)
        
        // Initialization code
    }
    
    
    func touch(_ sender:UITapGestureRecognizer)
    {
        delegate?.imageOutletTouched2()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
