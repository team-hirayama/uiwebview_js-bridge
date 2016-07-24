//
//  ParameterTest.swift
//  JsBridge
//
//  Created by Oka Yuya on 2016/07/24.
//  Copyright © 2016年 nnsnodnb. All rights reserved.
//

import XCTest
@testable import JsBridge

class ParameterTest: XCTestCase {
    func testParameter() {
        let query = QueryParser.queryDictionary("view=success&age=20&name=nnsnodnb")
        XCTAssertEqual(query["view"], "success")
        XCTAssertEqual(query["age"], "20")
        XCTAssertEqual(query["name"], "nnsnodnb")
    }
}
