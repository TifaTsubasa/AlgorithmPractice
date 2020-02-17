//
//  rn11.swift
//  AlgorithmPracticeTests
//
//  Created by upmer on 2020/2/17.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class rn11: XCTestCase {

    func minArray(_ numbers: [Int]) -> Int {
        let count = numbers.count
        if count == 0 { return 0 }
        if count == 1 { return numbers[0] }
        var left = 0
        var right = count - 1
        while left < right {
            let mid = left + (right - left) / 2
            print(left, mid, right)
            if numbers[mid] > numbers[right] {
                left = mid + 1
            } else if numbers[mid] < numbers[right] {
                right = mid
            } else {
                right -= 1
            }
        }
        return numbers[right]
    }
    
    func testCase() {
        XCTAssertEqual(minArray([2,2,1,2,2]), 1)
    }
    
    func testExample() {
        XCTAssertEqual(minArray([]), 0)
        XCTAssertEqual(minArray([1]), 1)
        XCTAssertEqual(minArray([1,1]), 1)
        XCTAssertEqual(minArray([1,1,1]), 1)
        XCTAssertEqual(minArray([2,3,1]), 1)
        XCTAssertEqual(minArray([2,3,4,1]), 1)
        XCTAssertEqual(minArray([1,2,3]), 1)
        XCTAssertEqual(minArray([3,2,1]), 1)
        XCTAssertEqual(minArray([2,2,1]), 1)
        XCTAssertEqual(minArray([2,2,2,0,1]), 0)
        XCTAssertEqual(minArray([2,2,2,1,2]), 1)
        XCTAssertEqual(minArray([2,2,1,2,2]), 1)
        XCTAssertEqual(minArray([3,1,3]), 1)
        XCTAssertEqual(minArray([3,1]), 1)
    }

}
