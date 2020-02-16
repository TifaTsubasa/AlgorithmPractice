//
//  n509.swift
//  AlgorithmPracticeTests
//
//  Created by upmer on 2020/2/16.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n509: XCTestCase {
    func fib(_ N: Int) -> Int {
        if N == 0 { return 0 }
        if N == 1 { return 1 }
        var pre1 = 0
        var pre2 = 1
        for _ in 2...N {
            let sum = pre1 + pre2
            pre1 = pre2
            pre2 = sum
        }
        return pre2
    }

    func testExample() {
        XCTAssertEqual(fib(2), 1)
        XCTAssertEqual(fib(3), 2)
        XCTAssertEqual(fib(4), 3)
        XCTAssertEqual(fib(5), 5)
        XCTAssertEqual(fib(6), 8)
    }


}
