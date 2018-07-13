//
//  WriteApplyService.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 12..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct WriteApplyService: PostableService {
    
    typealias NetworkData = DefaultVO
    static let shareInstance = WriteApplyService()

    
    func writeApply(url : String, params : [String : Any] , completion : @escaping (NetworkResult<Any>) -> Void){
        post(url, params: params){
            (result) in
            switch result {
            case .success(let networkResult):
                switch networkResult.message {
                    case "Successfully Create Board Data" :
                        completion(.networkSuccess(""))
                    case "Null Value" :
                        completion(.nullValue)
                    case "Invalid Server Error: XXX" :
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
