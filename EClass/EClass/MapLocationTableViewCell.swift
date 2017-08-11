//
//  MapLocationTableViewCell.swift
//  
//
//  Created by Kang Seongchan on 2017. 8. 10..
//
//

import UIKit
import MapKit

class MapLocationTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var locationMap: MKMapView!
    
    @IBOutlet weak var tutorComment: UILabel!
}
