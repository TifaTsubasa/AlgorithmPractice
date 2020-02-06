//
//  n14.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/2/6.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n14: XCTestCase {
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 { return "" }
        var prefix = ""
        var i = 0
        while i < strs[0].count {
            var set = Set<String.Element>()
            for str in strs {
                if i == str.count { return prefix }
                let char = str[str.index(str.startIndex, offsetBy: i)]
                set.insert(char)
            }
            if set.count == 1 {
                prefix.append(set.first!)
            } else {
                return prefix
            }
            print(i, set, prefix)
            i += 1
        }
        return prefix
    }
    
    
    func testCase() {
        XCTAssertEqual(longestCommonPrefix([]), "")
        XCTAssertEqual(longestCommonPrefix(["", ""]), "")
        XCTAssertEqual(longestCommonPrefix(["flower","flow","flight"]), "fl")
        XCTAssertEqual(longestCommonPrefix(["abca","abc"]), "abc")
        XCTAssertEqual(longestCommonPrefix(["dog","racecar","car"]), "")
        XCTAssertEqual(longestCommonPrefix(["a", "abaweror"]), "a")
        XCTAssertEqual(longestCommonPrefix(["", "abaweror"]), "")
    }
}
