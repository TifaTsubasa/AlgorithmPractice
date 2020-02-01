//
//  n72.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/1/25.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n72: XCTestCase {
    
    /*
     
     1 a
     a 0
     
     * b
     a 1
     
     * b b
     a 1 2
     
     * b
     b 0
     b 1
     
     * a b
     a 0 1
     a 0 1
     
     * a b a
     b 1 0 1
     a 0 1 1
     
     * a b a b
     c 1 2 3 4
     a 1 2 2 3
     
     * h o r s e
     r 1 2 2 3 4
     o 2 2 3 4 5
     s 3 3 4 4 5
     
     */
    
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1 == word2 { return 0 }
        if word1.count == 0 { return word2.count }
        if word2.count == 0 { return word1.count }
        var dp = [[Int]]()
        let a = word1.map { $0 }
        let b = word2.map { $0 }
        for _ in 0...b.count {
            dp.append(Array(repeating: 0, count: a.count + 1))
        }
        dp[0][0] = 0
        for i in 1...a.count {
            dp[0][i] = dp[0][i - 1] + 1
        }
        for i in 1...b.count {
            dp[i][0] = dp[i - 1][0] + 1
        }
        for i in 1...a.count {
            for j in 1...b.count {
                if a[i - 1] == b[j - 1] {
                    dp[j][i] = dp[j - 1][i - 1]
                } else {
                    dp[j][i] = min(dp[j - 1][i - 1], dp[j][i - 1], dp[j - 1][i]) + 1
                }
            }
        }
        return dp[b.count][a.count]
    }

    func testExample() {
        XCTAssertEqual(minDistance("", ""), 0)
        XCTAssertEqual(minDistance("a", ""), 1)
        XCTAssertEqual(minDistance("", "a"), 1)
        XCTAssertEqual(minDistance("a", "a"), 0)
        XCTAssertEqual(minDistance("abab", "ca"), 3)
        XCTAssertEqual(minDistance("horse", "ros"), 3)
        XCTAssertEqual(minDistance("intention", "execution"), 5)
        XCTAssertEqual(minDistance("eat", "sea"), 2)
        XCTAssertEqual(minDistance("ab", "ac"), 1)
        XCTAssertEqual(minDistance("abcdefg", "bcd"), 4)
        XCTAssertEqual(minDistance("abcdefg", "fbcdg"), 3)
        XCTAssertEqual(minDistance("abcdefg", "xbcdx"), 4)
        XCTAssertEqual(minDistance("pneumonoultramicroscopicsilicovolcanoconiosis", "ultramicroscopically"), 27)
    }
//    pneumono ultramicroscopic si licovo l c anoconiosis
//             ultramicroscopic a  l      l y
//    p ult si la l c ee
//      ult a  l  l y
    /**
     
        0 a b a b
     0  0 1 2 3 4
     c  1 1 1 2 0
     a  2 0 0 0 0
     */

}
