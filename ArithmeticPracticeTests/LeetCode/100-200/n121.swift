//
//  n121.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/2/10.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n121: XCTestCase {
    
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count <= 1 { return 0 }
        var minPrice = prices[0]
        var res = 0
        for i in 1..<prices.count {
            let price = prices[i]
            if price < minPrice { minPrice = price }
            if price - minPrice > res { res = price - minPrice }
        }
        return res
    }

    func testExample() {
        XCTAssertEqual(maxProfit([]), 0)
        XCTAssertEqual(maxProfit([1]), 0)
        XCTAssertEqual(maxProfit([7,1,5,3,6,4]), 5)
        XCTAssertEqual(maxProfit([7,6,4,3,1]), 0)
        XCTAssertEqual(maxProfit([1, 3, 4, 2]), 3)
        XCTAssertEqual(maxProfit([7,2,5,1,3]), 3)
    }

}
