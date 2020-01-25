//
//  n64.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/1/25.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n64: XCTestCase {
    
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        if m == 0 { return 0 }
        let n = grid[0].count
        if n == 0 { return 0 }
        var dp = [[Int]]()
        for _ in 0..<m {
            dp.append(Array(repeating: 0, count: n))
        }
        dp[0][0] = grid[0][0]
        for i in 1..<n {
            dp[0][i] = dp[0][i - 1] + grid[0][i]
        }
        for i in 1..<m {
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        }
        for i in 1..<n {
            for j in 1..<m {
                dp[j][i] = min(dp[j][i - 1], dp[j - 1][i]) + grid[j][i]
            }
        }
        return dp[m - 1][n - 1]
    }
    
    /**
     1 4 5
     2 0 0
     6 0 0
     */
    func testExample() {
        XCTAssertEqual(minPathSum([]), 0)
        XCTAssertEqual(minPathSum([[]]), 0)
        XCTAssertEqual(minPathSum([[0]]), 0)
        XCTAssertEqual(minPathSum([[1]]), 1)
        XCTAssertEqual(minPathSum([
          [1,3,1],
          [1,5,1],
          [4,2,1]
        ]), 7)
    }

}
