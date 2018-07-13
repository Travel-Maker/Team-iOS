//
//  JoinSercvice.swift
//  TravelMaker
//
//  Created by 조예은 on 2018. 7. 12..
//  Copyright © 2018년 GGOMMI. All rights reserved.
//
//
//import Foundation
//import Alamofire
//import SwiftyJSON
//
//
//struct JoinService: PostableService {
//    
//    typealias NetworkData = JoinVO
//    static let shareInstance = JoinService()
//    
//    func join(url : String, params : [String : Any], completion : @escaping (NetworkResult<Any>) -> Void){
//        post(url, params: params) { (result) in
//            switch result {
//            case .success(let networkResult):
//                switch networkResult.message {
//                case "Login Success" :
//                    completion(.networkSuccess(""))
//                case "Null Value" :
//                    completion(.nullValue)
//                case "Invalild Server Error" :
//                    completion(.duplicated)
//                default :
//                    break
//                }
//                
//                break
//            case .error(let errMsg) :
//                print(errMsg)
//                break
//            case .failure(_) :
//                completion(.networkFail)
//            }
//        }
//        
//    }
//    
//}
