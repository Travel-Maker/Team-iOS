//
//  APIService.swift
//  TravelMaker
//
//  Created by 이충신 on 2018. 7. 3..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import Foundation

protocol APIService {}

extension APIService {
    func url(_ path: String) -> String {
        return "http://13.209.235.23:2345" + path
    }
    
    func gsno(_ value : String?) -> String{
        return value ?? ""
    }
    
    func gino(_ value : Int?) -> Int {
        return value ?? 0
    }
    
}
