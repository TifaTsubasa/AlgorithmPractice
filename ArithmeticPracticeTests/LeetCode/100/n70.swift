//
//  n70.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/1/24.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n70: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func climbStairs(n: Int) -> Int {
        if n <= 2 { return n }
        var dp = [Int: Int]()
        dp[0] = 0
        dp[1] = 1
        dp[2] = 2
        var pre = 1
        var cur = 2
        for _ in 3...n {
            let sum = cur + pre
            pre = cur
            cur = sum
        }
        return cur
    }
    
    func testExample() {
        XCTAssertEqual(climbStairs(n: 0), 0)
        XCTAssertEqual(climbStairs(n: 1), 1)
        XCTAssertEqual(climbStairs(n: 2), 2)
        XCTAssertEqual(climbStairs(n: 3), 3)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
