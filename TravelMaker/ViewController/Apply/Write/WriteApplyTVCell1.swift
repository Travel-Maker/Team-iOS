//
//  WriteApplyTableViewCell1.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 6..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class WriteApplyTVCell1: UITableViewCell {

    @IBOutlet weak var outDateTextField: UITextField!
    @IBOutlet weak var outCityTextField: UITextField!
    @IBOutlet weak var houseTextField: UITextField!
    @IBOutlet weak var inDateTextField: UITextField!
    @IBOutlet weak var inCityTextField: UITextField!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
