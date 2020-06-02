//
//  n322.swift
//  AlgorithmPracticeTests
//
//  Created by ByteDance on 2020/4/16.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n322: XCTestCase {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        func dp(n: Int) -> Int {
            var count = Int.max;
            if n == 0 { return 0 }
            if n < 0 { return -1 }
            for coin in coins {
                if dp(n: n - coin) < 0 { continue }
                count = min(count, dp(n: n - coin) + 1)
            }
            return count > amount ? -1 : count
        }
        return dp(n: amount)
    }
    
    func coinChange1(_ coins: [Int], _ amount: Int) -> Int {
        var map: [Int: Int] = [:]
        
        func dp(n: Int) -> Int {
            if map.keys.contains(n) {
                return map[n]!
            }
            var count = Int.max;
            if n == 0 { return 0 }
            if n < 0 { return -1 }
            for coin in coins {
                let subproblemCount = dp(n: n - coin)
                if subproblemCount < 0 { continue }
                count = min(count, subproblemCount + 1)
            }
            map[n] = count > amount ? -1 : count
            return map[n]!
        }
        return dp(n: amount)
    }
    
    func coinChange2(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
        var dp: [Int: Int] = [0 : 0]
        for i in 1...amount {
            for coin in coins {
                if i - coin < 0 { continue }
                if dp[i - coin] == nil { continue }
                let subProblemCount = dp[i - coin]!
                dp[i] = min(dp[i] ?? Int.max, subProblemCount + 1)
            }
        }
        
        return dp[amount] ?? -1
    }
    
    func testCase() {
        let testFunc = coinChange1
        XCTAssertEqual(testFunc([2,5,10,1], 27), 4);
        XCTAssertEqual(testFunc([1, 2, 5], 11), 3);
        XCTAssertEqual(testFunc([2], 3), -1);
        XCTAssertEqual(testFunc([1], 0), 0);
    }
}
