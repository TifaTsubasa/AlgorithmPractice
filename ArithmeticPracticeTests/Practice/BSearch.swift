//
//  BSearch.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2019/12/17.
//  Copyright © 2019 upmer. All rights reserved.
//

import XCTest

class BSearch: XCTestCase {
    
    let test1 = [1,2,3,4,5,6,7,8]
    let test2 = [1,2,3,4,5,6,8,8,8,10,18]
    
    override func setUp() { }
    
    override func tearDown() { }
    
    func testBSearch() {
        func bsearch(nums: [Int], n: Int) -> Int {
            if nums.count == 0 { return -1 }
            var low = 0
            var high = nums.count - 1
            while low <= high {
                let mid = low + ((high - low) >> 1)
                if nums[mid] == n {
                    return mid
                } else if nums[mid] < n {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }
            return -1
        }
        
        func recursion(nums: [Int], n: Int, l: Int, r: Int) -> Int {
            if l > r { return -1 }
            let mid = l + ((r - l) >> 1)
            if nums[mid] == n {
                return mid
            } else if nums[mid] < n {
                return recursion(nums: nums, n: n, l: mid + 1, r: r)
            } else {
                return recursion(nums: nums, n: n, l: l, r: mid - 1)
            }
        }
        
        func bsearch_recursion(nums: [Int], n: Int) -> Int {
            if nums.count == 0 { return -1 }
            return recursion(nums: nums, n: n, l: 0, r: nums.count - 1)
        }
        XCTAssertEqual(bsearch(nums: test1, n: 10), -1)
        XCTAssertEqual(bsearch(nums: test1, n: 5), 4)
        XCTAssertEqual(bsearch_recursion(nums: test1, n: 10), -1)
        XCTAssertEqual(bsearch_recursion(nums: test1, n: 5), 4)
    }
    
    func testBSearchFirstValue() {
        func bsearchFirstValue(nums: [Int], n: Int) -> Int {
            if nums.count == 0 { return -1 }
            var low = 0
            var high = nums.count - 1
            while low <= high {
                let mid = low + ((high - low) >> 1)
                let value = nums[mid]
                if value == n {
                    if mid == 0 || nums[mid - 1] != n {
                        return mid
                    } else {
                        high -= 1
                    }
                } else if value < n {
                    low += 1
                } else {
                    high -= 1
                }
            }
            return -1
        }
        XCTAssertEqual(bsearchFirstValue(nums: test1, n: 10), -1)
        XCTAssertEqual(bsearchFirstValue(nums: test2, n: 8), 6)
    }
    
    func testBSearchLastValue() {
        func bsearchLastValue(nums: [Int], n: Int) -> Int {
            if nums.count == 0 { return -1 }
            var low = 0
            var high = nums.count - 1
            while low <= high {
                let mid = low + ((high - low) >> 1)
                let value = nums[mid]
                if value == n {
                    if mid == nums.count - 1 || nums[mid + 1] != n {
                        return mid
                    } else {
                        low += 1
                    }
                } else if value < n {
                    low += 1
                } else {
                    high -= 1
                }
            }
            return -1
        }
        XCTAssertEqual(bsearchLastValue(nums: test2, n: 8), 8)
    }
}
