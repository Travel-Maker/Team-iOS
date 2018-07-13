//
//  WriteApplyVO.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 11..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import Foundation

struct ShowApplyVO : Codable {
    
    let message: String
    let sender: [Sender]
    let board: [Board]
    let plan: [Plan]
    let comment: [Comment]
    
    enum CodingKeys : String, CodingKey{
        case message = "message"
        case sender = "sender"
        case board = "board"
        case plan = "plan"
        case comment = "comment"
    }
}

struct Sender : Codable {
    let userNick: String
    
    enum CodingKeys: String, CodingKey{
        case userNick = "user_nick"
    }
}
struct Board : Codable {
    let boardIdx: Int
    let countryIdx: Int
    let userIdx: Int
    let expertIdx: Int?
    let boardTitle: String
    let boardCity: String
    let boardDepTime: String
    let boardArrTime: String
    let boardContent: String
    let boardStatus: Int
    let boardBudget: Int
    let boardDays: Int
    let boardCoin: Int
    let boardWritetime: String
    
    enum CodingKeys: String, CodingKey {
        case boardIdx = "board_idx"
        case countryIdx = "country_idx"
        case userIdx = "user_idx"
        case expertIdx = "expert_idx"
        case boardTitle = "board_title"
        case boardCity = "board_city"
        case boardDepTime = "board_dep_time"
        case boardArrTime = "board_arr_time"
        case boardContent = "board_content"
        case boardStatus = "board_status"
        case boardBudget = "board_budget"
        case boardDays = "board_days"
        case boardCoin = "board_coin"
        case boardWritetime = "board_writetime"
    }
}
struct Plan : Codable {
    let planIdx: Int
    let countryIdx: Int
    let planCount: Int
    let planIn: String
    let planInDate: String
    let planAccName: String
    let planOut: String
    let planOutDate: String
    let boardIdx: Int
    
    enum CodingKeys: String, CodingKey {
        case planIdx = "plan_idx"
        case countryIdx = "country_idx"
        case planCount = "plan_count"
        case planIn = "plan_in"
        case planInDate = "plan_in_date"
        case planAccName = "plan_acc_name"
        case planOut = "plan_out"
        case planOutDate = "plan_out_date"
        case boardIdx = "board_idx"
    }
}
struct Comment : Codable {
    let userInfo: String
    let commentData: [CommentData]
    
    enum CodingKeys: String, CodingKey {
        case userInfo = "user_info"
        case commentData = "comment_data"
    }
}

struct CommentData : Codable {
    let commentIdx: Int
    let userIdx: Int
    let commentContent: String
    let commentWritetime: String
    let boardIdx: Int
    
    enum CodingKeys:String, CodingKey {
        case commentIdx = "comment_idx"
        case userIdx = "user_idx"
        case commentContent = "comment_content"
        case commentWritetime = "comment_writetime"
        case boardIdx = "board_idx"
    }
}
