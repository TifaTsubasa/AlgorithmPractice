//
//  n3.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/2/6.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n3: XCTestCase {
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 { return 0 }
        var maxStr = ""
        var curStr = ""
        for char in s {
            while curStr.contains(char) {
                curStr.removeFirst()
            }
            curStr.append(char)
            if curStr.count > maxStr.count {
                maxStr = curStr
            }
        }
        return maxStr.count
    }
    
    func testExample() {
        XCTAssertEqual(lengthOfLongestSubstring(""), 0)
        XCTAssertEqual(lengthOfLongestSubstring("a"), 1)
        XCTAssertEqual(lengthOfLongestSubstring("abcd"), 4)
        XCTAssertEqual(lengthOfLongestSubstring("aba"), 2)
        XCTAssertEqual(lengthOfLongestSubstring("abcabcbb"), 3)
        XCTAssertEqual(lengthOfLongestSubstring("bbbbb"), 1)
        XCTAssertEqual(lengthOfLongestSubstring("pwwkew"), 3)
        XCTAssertEqual(lengthOfLongestSubstring("dvdf"), 3)
        XCTAssertEqual(lengthOfLongestSubstring("dvavfe"), 4)
        XCTAssertEqual(lengthOfLongestSubstring("abba"), 2)
    }
    
}
