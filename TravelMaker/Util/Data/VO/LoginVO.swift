//
//  JoinVO.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 11..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import Foundation

struct LoginVO: Codable {
    let message: String
    let userIdx : Int?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case userIdx = "user_idx"
    }
    
}
