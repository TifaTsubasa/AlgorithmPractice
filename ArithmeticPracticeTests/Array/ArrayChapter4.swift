//
//  ArrayChapter4.swift
//  AlgorithmPracticeTests
//
//  Created by upmer on 2019/11/17.
//  Copyright © 2019 upmer. All rights reserved.
//

import XCTest

class ArrayChapter4: XCTestCase {
    
    override func setUp() {}
    
    override func tearDown() {}
    
    func testReverseString() {
        func reverseString(_ s: inout [Character]) {
            if s.count == 0 { return }
            var i = 0
            var j = s.count - 1
            while i < j {
                let tmp = s[j]
                s[j] = s[i]
                s[i] = tmp
                i += 1
                j -= 1
            }
        }
        
        var a: [Character] = ["h","e","l","l","o"]
        reverseString(&a)
        XCTAssertEqual(a, ["o","l","l","e","h"])
        var b: [Character] = ["H","a","n","n","a","h"]
        reverseString(&b)
        XCTAssertEqual(b, ["h","a","n","n","a","H"])
    }
    
    func testArrayPairSum() {
        func arrayPairSum(_ nums: [Int]) -> Int {
            let count = nums.count
            if count == 0 { return 0 }
            guard count % 2 == 0 else { return 0 }
            let sortNums = nums.sorted(by: { $0 < $1 })
            var sum = 0
            var index = 0
            while index < count {
                sum += sortNums[index]
                index += 2
            }
            return sum
        }
        XCTAssertEqual(arrayPairSum([1,4,3,2]), 4)
    }
    
    func testTwoSum() {
        func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
            let count = numbers.count
            if count < 2 { return [] }
            var i = 0
            var j = count - 1
            while i < j {
                let sum = numbers[i] + numbers[j]
                if sum == target {
                    return [i + 1, j + 1]
                }
                if sum < target {
                    i += 1
                } else if sum > target {
                    j -= 1
                }
            }
            return []
        }
        XCTAssertEqual(twoSum([-1, 0], -1), [1, 2])
        XCTAssertEqual(twoSum([2, 7, 11, 15], 9), [1, 2])
        XCTAssertEqual(twoSum([2, 7, 11, 15], 18), [2, 3])
        XCTAssertEqual(twoSum([1,2,3,4,4,9,56,90], 8), [4, 5])
    }
    
    func testRemoveElement() {
        func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
            if nums.count == 0 { return 0 }
            var i = 0
            while i < nums.count {
                if nums[i] == val {
                    nums.remove(at: i)
                } else {
                    i += 1
                }
            }
            return nums.count
        }
        var a = [3,2,2,3]
        var b = [0,1,2,2,3,0,4,2]
        var c = [2, 2]
        XCTAssertEqual(removeElement(&a, 3), 2)
        XCTAssertEqual(removeElement(&b, 2), 5)
        XCTAssertEqual(removeElement(&c, 2), 0)
    }
    
    func testFindMaxConsecutiveOnes() {
        func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
            if nums.count == 0 { return 0 }
            var max = 0
            var count = 0
            for i in 0..<(nums.count) {
                if nums[i] == 1 {
                    count += 1
                } else {
                    if count > max { max = count }
                    count = 0
                }
            }
            if count > max { max = count }
            return max
        }
        XCTAssertEqual(findMaxConsecutiveOnes([1,1,0,1,1,1]), 3)
        XCTAssertEqual(findMaxConsecutiveOnes([]), 0)
        XCTAssertEqual(findMaxConsecutiveOnes([1]), 1)
        XCTAssertEqual(findMaxConsecutiveOnes([1,0,1,1,0,1]), 2)
        XCTAssertEqual(findMaxConsecutiveOnes([0, 1]), 1)
    }
    
    func testMinSubArrayLen() {
        func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
            var min = nums.count + 1
            var left = 0
            var sum = 0
            for i in 0..<(nums.count) {
                sum += nums[i]
                while sum >= s {
                    let count = i - left + 1
                    if count < min { min = count }
                    sum -= nums[left]
                    left += 1
                }
            }
            return (min > nums.count) ? 0 : min
        }
        XCTAssertEqual(minSubArrayLen(7, []), 0)
        XCTAssertEqual(minSubArrayLen(7, [4,3]), 2)
        XCTAssertEqual(minSubArrayLen(7, [2,3,1,2,4,3]), 2)
        XCTAssertEqual(minSubArrayLen(7, [3,4,1,2,2,3]), 2)
        XCTAssertEqual(minSubArrayLen(20, [2,3,1,2,4,3]), 0)
    }
}
