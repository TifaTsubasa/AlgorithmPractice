//
//  n567.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/2/6.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n567: XCTestCase {
    
    func checkInclusion1(_ s1: String, _ s2: String) -> Bool {
        if s1.count > s2.count { return false }
        
        var dict1 = [Character: Int]()
        var dict2 = dict1
        s1.forEach {
            dict1[$0] = (dict1[$0] ?? 0) + 1
        }
        
        let s2 = Array(s2)
        let n = s1.count
        for i in 0..<s2.count {
            dict2[s2[i]] = (dict2[s2[i]] ?? 0) + 1
            if i >= n {
                let count = dict2[s2[i - n]]!
                dict2[s2[i - n]] = count == 1 ? nil : count - 1
            }
            if dict2 == dict1 {
                return true
            }
        }
        
        return false
    }
    
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.count == 0 || s1.count > s2.count { return false }
        var sourceHashMap = [Character: Int]()
        s1.forEach {
            sourceHashMap[$0] = (sourceHashMap[$0] ?? 0) + 1
        }
        let n = s1.count
        var curHashMap = [Character: Int]()
        
        let s2 = Array(s2)
        for i in 0..<s2.count {
            let char = s2[i]
            let count = curHashMap[char] ?? 0
            curHashMap[char] = count + 1
            if i >= n {
                let firstChar = s2[i - n]
                let count = curHashMap[firstChar] ?? 0
                curHashMap[firstChar] = (count <= 1) ? nil : count - 1
            }
            print(curHashMap)
            if curHashMap == sourceHashMap { return true }
        }
        return false
    }

    func testExample() {
//        XCTAssertEqual(checkInclusion("ab", "eidbaooo"), true)
//        XCTAssertEqual(checkInclusion("ab", "eidboaoo"), false)
//        XCTAssertEqual(checkInclusion("ab", "eiacacbcab"), true)
//        XCTAssertEqual(checkInclusion("ab", "aab"), true)
//        XCTAssertEqual(checkInclusion("ab", "aaab"), true)
//        XCTAssertEqual(checkInclusion("cda", "dcda"), true)
        XCTAssertEqual(checkInclusion("hello", "ooolleoooleh"), false)
//        XCTAssertEqual(checkInclusion("abcd", "abcbd"), false)
//        XCTAssertEqual(checkInclusion("abc", "aaaabbbbcccc"), false)
//        XCTAssertEqual(checkInclusion("vxqakfyaqahufxfizupjrkkifjlbfqfeprqrfjvxnubntdtlvz", "sfslnheghnbhhicbvaddqadvxqakfyaqahufxfizupjrkkifjlbfqfeprqrfjvxnubntdtlvzwicekgu"), true)
    }


}
