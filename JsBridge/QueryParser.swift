//
//  QueryParser.swift
//  JsBridge
//
//  Created by Oka Yuya on 2016/07/23.
//  Copyright © 2016年 nnsnodnb. All rights reserved.
//

import Foundation

class QueryParser {
    
    class func queryDictionary(query: String) -> [String:String] {
        
        var querys = [String: String]()
        let pairs = query.componentsSeparatedByString("&");
        
        for pair in pairs {
            let elements = pair.componentsSeparatedByString("=")
            let key = elements[0].stringByRemovingPercentEncoding
            let value = elements[1].stringByRemovingPercentEncoding
            
            if let key = key, value = value {
                querys[key] = value
            }
        }
        return querys
    }
}