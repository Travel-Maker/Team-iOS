//
//  ShowApplyService.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 12..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct ShowApplyService: GettableService {

    typealias NetworkData = ShowApplyVO
    static let shareInstance = ShowApplyService()

    func applyInit(url : String, completion : @escaping (NetworkResult<Any>) -> Void){
        get(url) { (result) in
            switch result {
            case .success(let networkResult):
                switch networkResult.message {
                case "Successfully Get Total Board Data" :
                    completion(.networkSuccess(networkResult.board))
                case "Invaild Server Error : select total board date"  :
                    completion(.serverErr)
                default :
                    break
                }
                break
            case .error(let errMsg) :
                print(errMsg+"______________________")
                break
            case .failure(_) :
                completion(.networkFail)
            }
        }

    }

}
