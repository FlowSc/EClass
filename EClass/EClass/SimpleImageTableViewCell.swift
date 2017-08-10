//
//  SimpleImageTableViewCell.swift
//  EClass
//
//  Created by Kang Seongchan on 2017. 8. 9..
//  Copyright © 2017년 Kang Seongchan. All rights reserved.
//

import UIKit

class SimpleImageTableViewCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func settingMyImage(_ image:UIImage) {
        myImage.image = image
    }

}
