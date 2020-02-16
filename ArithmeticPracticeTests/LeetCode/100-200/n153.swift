//
//  n153.swift
//  AlgorithmPracticeTests
//
//  Created by upmer on 2020/2/16.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n153: XCTestCase {
    
    func findMin(_ nums: [Int]) -> Int {
        if nums.count == 0 { return 0 }
        let count = nums.count
        var left = 0
        var right = count - 1
        while left < right {
            let mid = left + (right - left) / 2
            print(left, mid, right)
            if nums[mid] > nums[mid + 1] {
                return nums[mid + 1]
            }
            if nums[mid] > nums[right] {
                left = mid
            } else {
                right = mid
            }
        }
        return nums[left]
    }
    
    func testExample() {
        XCTAssertEqual(findMin([]), 0)
        XCTAssertEqual(findMin([1,2,3]), 1)
        XCTAssertEqual(findMin([2,3,1]), 1)
        XCTAssertEqual(findMin([3,1,2]), 1)
        XCTAssertEqual(findMin([3,4,5,1,2]), 1)
        XCTAssertEqual(findMin([4,5,6,7,0,1,2]), 0)
        XCTAssertEqual(findMin([2,3,4,5,1]), 1)
        XCTAssertEqual(findMin([2,3,4,1]), 1)
    }

}
