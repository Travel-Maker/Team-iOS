//
//  ShowApplyTableViewCell2.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 6..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class ShowApplyTVCell2: UITableViewCell {

    @IBOutlet weak var repleProfileImage: UIImageView!
    @IBOutlet weak var userInfo: UILabel!
    @IBOutlet weak var commentContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure3(comment: Comment, content: CommentData){
        userInfo.text = comment.userInfo
        commentContent.text = content.commentContent
    }
}
