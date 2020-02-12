//
//  n3.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/2/12.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class rn3: XCTestCase {
    
    
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var hashMap = [Int: Bool]()
        for value in nums {
            if let _ = hashMap[value] {
               return value
            } else {
                hashMap[value] = true
            }
        }
        return -1
    }
    
    func findRepeatNumber1(_ nums: [Int]) -> Int {
        if nums.count <= 1 { return -1 }
        var mutableNums = nums
        quickSort(nums: &mutableNums, l: 0, r: mutableNums.count - 1)
        var preValue = -1
        for value in mutableNums {
            if preValue == value { return value }
            preValue = value
        }
        return preValue
    }
    
    func quickSort(nums: inout [Int], l: Int, r: Int) {
        if l >= r { return }
        let pivot = partition(start: l, end: r, nums: &nums)
        quickSort(nums: &nums, l: l, r: pivot - 1)
        quickSort(nums: &nums, l: pivot + 1, r: r)
    }
    
    func partition(start: Int, end: Int, nums: inout [Int]) -> Int {
        let value = nums[start]
        var lessEnd = start
        for i in (start + 1)...end {
            if nums[i] < value {
                nums.swapAt(lessEnd + 1, i)
                lessEnd += 1
            }
        }
        nums.swapAt(start, lessEnd)
        return lessEnd
    }
    
    func testQuickSort() {
        var nums = [2, 3, 1, 0, 2, 5, 3]
        quickSort(nums: &nums, l: 0, r: nums.count - 1)
        XCTAssertEqual(nums, [0, 1, 2, 2, 3, 3, 5])
    }

    func testExample() {
        let value = findRepeatNumber([2, 3, 1, 0, 2, 5, 3])
        XCTAssertTrue([2, 3].contains(value))
        XCTAssertEqual(findRepeatNumber([]), -1)
        XCTAssertEqual(findRepeatNumber([2]), -1)
    }

}
