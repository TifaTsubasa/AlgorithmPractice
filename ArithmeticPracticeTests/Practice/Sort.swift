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
  
  func testSelectSort() {
    func selectSort(_ nums: inout [Int]) {
      let count = nums.count
      if count <= 1 { return }
      for i in 0..<(count - 1) {
        var minIndex = i
        var min = nums[i]
        for j in i..<count {
          if min > nums[j] {
            min = nums[j]
            minIndex = j
          }
        }
        let tmp = nums[i]
        nums[i] = nums[minIndex]
        nums[minIndex] = tmp
        print(nums)
      }
    }
    var arr1 = test1.0
    selectSort(&arr1)
    XCTAssertEqual(arr1, test1.1)
    var arr2 = test2.0
    selectSort(&arr2)
    XCTAssertEqual(arr2, test2.1)
    var arr3 = test3.0
    selectSort(&arr3)
    XCTAssertEqual(arr3, test3.1)
  }
  
  func testMergeSort() {
    func merge(_ nums: inout [Int], l: Int, center: Int, r: Int) {
        var array = [Int]()
        var left = l
        var right = center + 1
        while array.count < (r - l + 1) {
            if right > r || nums[left] <= nums[right] {
                array.append(nums[left])
                left += 1
            } else {
                array.append(nums[right])
                right += 1
            }
        }
        var index = 0
        for j in l...r {
            nums[j] = array[index]
            index += 1
        }
    }
    
    func mergeSort(_ nums: inout [Int], l: Int, r: Int) {
        if nums.count <= 1 { return }
        if l >= r { return }
        let center = (r - l) / 2 + l
        mergeSort(&nums, l: l, r: center)
        mergeSort(&nums, l: center + 1, r: r)
        merge(&nums, l: l, center: center, r: r)
    }
    
    
//    var arr1 = test1.0
//    mergeSort(&arr1, l: 0, r: arr1.count - 1)
//    XCTAssertEqual(arr1, test1.1)
    var arr2 = test2.0
    mergeSort(&arr2, l: 0, r: arr2.count - 1)
    XCTAssertEqual(arr2, test2.1)
//    var arr3 = test3.0
//    mergeSort(&arr3, l: 0, r: arr3.count - 1)
//    XCTAssertEqual(arr3, test3.1)
  }
  
  func testQuickSort() {
    func partition(_ nums: inout [Int], l: Int, r: Int) -> Int {
        let value = nums[l]
        var lessEnd = l // <
        for i in (l + 1)...r {
            if nums[i] < value {
                lessEnd += 1
                nums.swapAt(lessEnd, i)
            }
        }
        nums.swapAt(l, lessEnd)
        return lessEnd
    }
    
    func quickSort(_ nums: inout [Int], l: Int, r: Int) {
        if l >= r { return }
        let pivot = partition(&nums, l: l, r: r)
        quickSort(&nums, l: l, r: pivot)
        quickSort(&nums, l: pivot + 1, r: r)
    }
    
    var arr1 = test1.0
    quickSort(&arr1, l: 0, r: arr1.count - 1)
    XCTAssertEqual(arr1, test1.1)
    var arr2 = test2.0
    quickSort(&arr2, l: 0, r: arr2.count - 1)
    XCTAssertEqual(arr2, test2.1)
    var arr3 = test3.0
    quickSort(&arr3, l: 0, r: arr3.count - 1)
    XCTAssertEqual(arr3, test3.1)
  }
}
