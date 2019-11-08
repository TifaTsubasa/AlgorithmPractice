//
//  ArrayChapter1.swift
//  ArithmeticPracticeTests
//
//  Created by tsuf on 2019/11/8.
//  Copyright © 2019 upmer. All rights reserved.
//

import XCTest

class ArrayChapter1: XCTestCase {
  
  override func setUp() { }
  
  override func tearDown() {}
  
  func testPivotIndexOfNums() {
    func pivotIndex(_ nums: [Int]) -> Int {
      if nums.count == 0 { return -1 }
      var pivot = 0
      var pivotValue = nums[pivot]
      var sum = nums.reduce(0, +) - pivotValue
      var leftSum = 0
      while pivot < nums.count - 1 {
        print(sum, leftSum)
        if sum == leftSum { break }
        leftSum += pivotValue
        pivot += 1
        pivotValue = nums[pivot]
        sum -= pivotValue
      }
      if sum != leftSum { return -1 }
      return pivot
    }
    XCTAssertEqual(pivotIndex([1, 7, 3, 6, 6, 5]), 3)
  }
  
  func testDominatIndexOfNums() {
    func dominantIndex(_ nums: [Int]) -> Int {
      var maxValue = 0
      var secondMaxValue = 0
      var index = -1
      for (i, n) in nums.enumerated() {
        if n > maxValue {
          secondMaxValue = maxValue
          maxValue = n
          index = i
        } else {
          if n > secondMaxValue {
            secondMaxValue = n
          }
        }
      }
      if maxValue >= (2 * secondMaxValue) { return index }
      return -1
    }
    XCTAssertEqual(dominantIndex([0,1 ,2, 4, 3]), -1)
  }
  
  func testPlusOneOfNums() {
    func plusOne(_ digits: [Int]) -> [Int] {
      let lastNum = digits.last!
      if lastNum < 9 {
        
      }
      return []
    }
    
    XCTAssertEqual(plusOne([1]), [2])
    XCTAssertEqual(plusOne([9]), [1, 0])
    XCTAssertEqual(plusOne([1, 9]), [2, 0])
    XCTAssertEqual(plusOne([0, 1, 9]), [0, 2, 0])
    XCTAssertEqual(plusOne([0, 9, 9]), [1, 0, 0])
  }
}
