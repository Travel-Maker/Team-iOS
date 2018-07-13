//
//  HomeDetailTableViewCell.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 5..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class HomeDetailTVCell2: UITableViewCell {
    
    @IBOutlet weak var numLB: UILabel!
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var commentLB: UILabel!
    
    func configure(apply : BoardData){
        
        titleLB.text = apply.boardTitle
        commentLB.text = (String)(apply.commentCount)
      
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
