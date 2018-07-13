//
//  Test.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 9..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import Foundation

func getPalceString(placeName: String?, comment: String?) -> String {
    let place = placeName ?? ""
    let cmt = comment ?? ""
    return "{ \"place_name\" : \(place), \"comment\" : \(cmt) }"
}

let array = [String]()

let dic = [
    "test" : [
        "test1" : "~~~"
    ]
]
