//
//  ExpertApplyCell3.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 6..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class ExpertApplyTVCell3: UITableViewCell {

    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var specialTextView: UITextView!
    
    @IBOutlet weak var availCoinLabel: UILabel!
    @IBOutlet weak var payCoinLabel: UILabel!
    @IBOutlet weak var remainCoinLabel: UILabel!
    @IBOutlet weak var confirmBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
