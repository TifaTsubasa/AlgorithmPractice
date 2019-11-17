//
//  ArrayChapter4.swift
//  AlgorithmPracticeTests
//
//  Created by upmer on 2019/11/17.
//  Copyright © 2019 upmer. All rights reserved.
//

import XCTest

class ArrayChapter4: XCTestCase {
    
    override func setUp() {}
    
    override func tearDown() {}
    
    func testReverseString() {
        func reverseString(_ s: inout [Character]) {
            if s.count == 0 { return }
            var i = 0
            var j = s.count - 1
            while i < j {
                let tmp = s[j]
                s[j] = s[i]
                s[i] = tmp
                i += 1
                j -= 1
            }
        }
        
        var a: [Character] = ["h","e","l","l","o"]
        reverseString(&a)
        XCTAssertEqual(a, ["o","l","l","e","h"])
        var b: [Character] = ["H","a","n","n","a","h"]
        reverseString(&b)
        XCTAssertEqual(b, ["h","a","n","n","a","H"])
    }
}
