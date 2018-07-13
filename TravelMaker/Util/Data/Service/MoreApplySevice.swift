//
//  MoreApplySevice.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 12..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct MoreApplyService: GettableService {
    
    typealias NetworkData = MoreApplyVO
    static let shareInstance = MoreApplyService()
    
    func moreApplyInit(url : String, completion : @escaping (NetworkResult<Any>) -> Void){
        get(url) { (result) in
            switch result {
            case .success(let networkResult):
                
                switch networkResult.message {
                case "Succeddfully Get Board Data":
                    completion(.networkSuccess(networkResult.boardData))
                case "Internal Server Error : Select Board" :
                    completion(.serverErr)
                default :
                    break
                }
                break
            case .error(let errMsg) :
                print(errMsg)
                break
            case .failure(_) :
                completion(.networkFail)
            }
        }
        
    }
    
}
