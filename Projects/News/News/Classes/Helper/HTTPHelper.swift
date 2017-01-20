//
//  HTTPHelper.swift
//  News
//
//  Created by Corotata on 2017/1/20.
//  Copyright © 2017年 Corotata. All rights reserved.
//

import UIKit
import Alamofire

enum HTTPRequestType {
    case GET
    case POST
}

class HTTPHelper {
    class func requestData(URLString : String, type : HTTPRequestType, parameters : [String : Any]?, finishedCallback:@escaping (_ response : Any?, _ error : Error?)->()){
        let httpMethod = (type == .GET) ? (HTTPMethod.get) :(HTTPMethod.post)
        Alamofire.request(URLString, method: httpMethod, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error as Any)
                finishedCallback(nil,response.result.error)
                return
            }
            finishedCallback(result,nil)
        }
    
    }
}
