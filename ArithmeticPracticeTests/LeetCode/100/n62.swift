//
//  n62.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/1/24.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n62: XCTestCase {
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m * n == 0 { return 0 }
        var dp = [[Int]]()
        for _ in 0..<n {
            dp.append(Array(repeating: 1, count: m))
        }
        for i in 1..<m {
            dp[0][i] = 1
        }
        for i in 1..<n {
            dp[i][0] = 1
        }
        
        for i in 1..<m {
            for j in 1..<n {
                dp[j][i] = dp[j - 1][i] + dp[j][i - 1]
            }
        }
        return dp[n - 1][m - 1]
    }
    
    /*
     0 1 2
     1 2 4
     */

    func testExample() {
        XCTAssertEqual(uniquePaths(1, 1), 1)
        XCTAssertEqual(uniquePaths(0, 0), 0)
        XCTAssertEqual(uniquePaths(2, 2), 2)
        XCTAssertEqual(uniquePaths(3, 2), 3)
        XCTAssertEqual(uniquePaths(7, 3), 28)
    }
}
