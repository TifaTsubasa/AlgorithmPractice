//
//  DynamicProgramming.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/1/20.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class DynamicProgramming: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func fib(n: Int) -> Int {
        if n <= 0 { return 0 }
        var dp = [Int: Int]()
        return helper(dp: &dp, n: n)
    }
    
    func helper( dp: inout [Int: Int], n: Int) -> Int {
        if n <= 2 { return 1 }
        let n1 = dp[n - 1] ?? helper(dp: &dp, n: n - 1)
        if dp[n - 1] == nil {
            dp[n - 1] = n1
        }
        let n2 = dp[n - 2] ?? helper(dp: &dp, n: n - 2)
        if dp[n - 2] == nil {
            dp[n - 2] = n2
        }
        return n1 + n2
    }
    
    func dynamicFib(n: Int) -> Int {
        var dp = [Int: Int]()
        dp[1] = 1
        dp[2] = 1
        for i in 3...n {
            dp[i] = dp[i - 1]! + dp[i - 2]!
        }
        return dp[n]!
    }

    func testFib() {
        XCTAssertEqual(fib(n: 20), 6765)
    }
    
    func testDynamicFib() {
        XCTAssertEqual(dynamicFib(n: 20), 6765)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
