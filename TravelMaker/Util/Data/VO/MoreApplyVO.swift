//
//  MoreApplyVO.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 12..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import Foundation

struct MoreApplyVO: Codable{
    let message: String
    let boardData: [BoardData]
    
    enum CodingKeys: String, CodingKey{
        case boardData = "board_data"
        case message = "message"
    }
}
struct BoardData: Codable {
    let boardIdx : Int
    let boardTitle : String
    let userIdx : Int
    let commentCount : Int
    let userNick : String
    
    enum CodingKeys: String, CodingKey {
        case boardIdx = "board_idx"
        case boardTitle = "board_title"
        case userIdx = "user_idx"
        case commentCount = "comment_count"
        case userNick = "user_nick"
    }
}
