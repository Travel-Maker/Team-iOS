//
//  ShowApplyTableViewCell1.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 6..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import UIKit

class ShowApplyTVCell1: UITableViewCell {

    @IBOutlet weak var boardCity: UILabel!
    @IBOutlet weak var boardTitle: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nickNameLB: UILabel!
    @IBOutlet weak var writeDateLB: UILabel!
    @IBOutlet weak var viewCountLB: UILabel!
    @IBOutlet weak var startTravelDateLB: UILabel!
    @IBOutlet weak var endTravelDateLB: UILabel!
    @IBOutlet weak var boardDays: UILabel!
    @IBOutlet weak var boardCoin: UILabel!
    
    @IBOutlet weak var planIn: UILabel!
    @IBOutlet weak var planInDate: UILabel!
    @IBOutlet weak var planAccName: UILabel!
    @IBOutlet weak var planOut: UILabel!
    @IBOutlet weak var planOutDate: UILabel!
    @IBOutlet weak var planContent: UILabel!
    
    
    @IBOutlet weak var addCommentTF: UITextField!
    
//    func configure0(sender : Sender){
//        nickNameLB.text = sender.userNick
//    }
    
    func configure(board : Board){
        boardCity.text = board.boardCity
        boardTitle.text = board.boardTitle
        writeDateLB.text = "11" // ***
        viewCountLB.text = "11" // ***
        startTravelDateLB.text = board.boardArrTime
        endTravelDateLB.text = board.boardDepTime
        boardDays.text = (String)(board.boardDays)
        boardCoin.text = (String)(board.boardCoin)
        profileImage.image = #imageLiteral(resourceName: "home_ic") // ***
    }
    
    func configure2(plan : Plan){
        planIn.text = plan.planIn
        planInDate.text = plan.planInDate
        planAccName.text = plan.planAccName
        planOut.text = plan.planOut
        planOutDate.text = plan.planOutDate
        planContent.text = "dd" // ***
    }
    
    

}
