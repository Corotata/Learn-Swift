//
//  News.swift
//  News
//
//  Created by Corotata on 2017/1/20.
//  Copyright © 2017年 Corotata. All rights reserved.
//

import UIKit

class News: NSObject {
    var replyCount : Int = 0
    var title : String = ""
    var imgsrc : String = ""
    var source : String = ""
    var lmodify : String = ""
    
    init(_ dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
        
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
    
}
