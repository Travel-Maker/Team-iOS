//
//  ExpertApplyCell2.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 6..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class ExpertApplyTVCell2: UITableViewCell {
    @IBOutlet weak var inDateLabel: UITextField!
    @IBOutlet weak var inCityLabel: UITextField!
    @IBOutlet weak var houseAddressLabel: UITextField!
    @IBOutlet weak var houseDateLabel: UITextField!
    @IBOutlet weak var outCityLabel: UITextField!
    @IBOutlet weak var outDateLabel: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
