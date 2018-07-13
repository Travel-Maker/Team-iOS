//
//  MoreApplyTableViewCell.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 5..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class MoreApplyTVCell: UITableViewCell {
    
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(apply : BoardData){
        
        titleLabel.text = apply.boardTitle
        commentLabel.text = (String)(apply.commentCount)
        //print("\(apply.boardTitle)")
        
        
        //사진 추가
//        if let url = URL(string: gsno(store.storePhoto)){
//            self.storeImageView.kf.setImage(with: url)
//        } else {
//            self.storeImageView.image = #imageLiteral(resourceName: "grocery")
//        }
    }
}
