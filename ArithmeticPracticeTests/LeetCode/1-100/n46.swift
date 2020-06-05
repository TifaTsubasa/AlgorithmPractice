//
//  n46.swift
//  AlgorithmPracticeTests
//
//  Created by ByteDance on 2020/6/4.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n46: XCTestCase {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        
        func backtrack(_ nums: [Int], tracker: inout [Int]) {
    
            if tracker.count == nums.count {
                res.append(tracker)
                return
            }
            
            for num in nums {
                if tracker.contains(num) {
                    continue
                }
                tracker.append(num)
                backtrack(nums, tracker: &tracker)
                tracker.removeLast()
            }
        }
        var t = [Int]()
        backtrack(nums, tracker: &t)

        return res
    }
    
    func testPermute() {
        XCTAssertEqual(permute([1, 2]), [[1, 2], [2, 1]])
    }
}
