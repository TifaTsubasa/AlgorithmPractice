//
//  Sort.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2019/11/29.
//  Copyright © 2019 upmer. All rights reserved.
//

import XCTest

class Sort: XCTestCase {
    
    let test1: ([Int], [Int]) = ([], [])
    let test2 = ([4,5,6,3,2,1], [1,2,3,4,5,6])
    let test3 = ([1], [1])

    func testBubbleSort() {
        func bubbleSort(_ nums: inout [Int]) {
            let count = nums.count
            if count <= 1 { return }
            var hasExchange = false
            for i in 0..<(count - 1) {
                for j in 0..<(count - i - 1) {
                    if nums[j] > nums[j + 1] {
                        let tmp = nums[j + 1]
                        nums[j + 1] = nums[j]
                        nums[j] = tmp
                        hasExchange = true
                    }
                }
                if hasExchange == false { break }
            }
        }
        var arr1 = test1.0
        bubbleSort(&arr1)
        XCTAssertEqual(arr1, test1.1)
        var arr2 = test2.0
        bubbleSort(&arr2)
        XCTAssertEqual(arr2, test2.1)
        var arr3 = test3.0
        bubbleSort(&arr3)
        XCTAssertEqual(arr3, test3.1)
    }

    func testInsertSort() {
        func insertSort(_ nums: inout [Int]) {
            let count = nums.count
            if count <= 1 { return }
            for i in 1..<count {
                let value = nums[i]
                var endIndex = -1
                for j in 0..<i {
                    let index = i - j - 1
                    print(index)
                    if nums[index] > value {
                        nums[index + 1] = nums[index]
                        print(nums)
                    } else {
                        endIndex = index
                        break
                    }
                }
                nums[endIndex + 1] = value
                print(nums)
            }
        }
        var arr1 = test1.0
        insertSort(&arr1)
        XCTAssertEqual(arr1, test1.1)
        var arr2 = test2.0
        insertSort(&arr2)
        XCTAssertEqual(arr2, test2.1)
        var arr3 = test3.0
        insertSort(&arr3)
        XCTAssertEqual(arr3, test3.1)
    }
}
