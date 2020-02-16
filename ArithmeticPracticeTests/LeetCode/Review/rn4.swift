//
//  rn4.swift
//  AlgorithmPracticeTests
//
//  Created by upmer on 2020/2/15.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class rn4: XCTestCase {
    
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        let n = matrix.count
        if n == 0 { return false }
        let m = matrix[0].count
        if m == 0 { return false }
        for i in 0..<n {
            if matrix[i][0] > target { break }
            for j in 0..<m {
                let value = matrix[i][j]
                if value == target { return true }
                if value > target { break }
            }
        }
        return false
    }

    func testExample() {
        XCTAssertEqual(findNumberIn2DArray([], 1), false)
        XCTAssertEqual(findNumberIn2DArray([[]], 1), false)
        XCTAssertEqual(findNumberIn2DArray([[2, 3], [5, 8]], 3), true)
        XCTAssertEqual(findNumberIn2DArray([[2, 3], [5, 8]], 5), true)
        XCTAssertEqual(findNumberIn2DArray([[2, 3], [5, 8]], 8), true)
        let arr = [
          [1,   4,  7, 11, 15],
          [2,   5,  8, 12, 19],
          [3,   6,  9, 16, 22],
          [10, 13, 14, 17, 24],
          [18, 21, 23, 26, 30]
        ]
        XCTAssertEqual(findNumberIn2DArray(arr, 5), true)
        XCTAssertEqual(findNumberIn2DArray(arr, 20), false)
    }
    
    

}
