//
//  ArrayChapter2.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2019/11/12.
//  Copyright © 2019 upmer. All rights reserved.
//

import XCTest

class ArrayChapter2: XCTestCase {
  
  override func setUp() {}
  
  override func tearDown() {}
  
  let a = [
   [ 1, 2, 3 ],
   [ 4, 5, 6 ],
   [ 7, 8, 9 ]
  ]
  
  let a1 = [
   [ 1, 2, 3 ],
   [ 4, 5, 6 ]
  ]
  
  let b = [[1, 2, 3]]
  let c = [[1], [2], [3]]
  
  func testFindDiagonalOrder() {
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
      let m = matrix.count
      let n = matrix.first?.count ?? 0
      if m == 0 || n == 0 { return [] }
      var left = 0
      var right = 0
      var array = [Int]()
      while (left + right) <= (m + n - 2)  {
        print(left, right)
        array.append(matrix[left][right])
        if (left + right) % 2 == 0 { // left -, right +
          left -= 1
          right += 1
          let sum = left + right
          if left < 0 || right == n {
            right = min(n - 1, right)
            left = max(0, sum + 1 - right)
          }
        } else {
          left += 1
          right -= 1
          let sum = left + right
          if left == m || right < 0 {
            left = min(m - 1, left)
            right = max(0, sum + 1 - left)
          }
        }
      }
      return array
    }
    XCTAssertEqual(findDiagonalOrder(a), [1,2,4,7,5,3,6,8,9])
    XCTAssertEqual(findDiagonalOrder(a1), [1,2,4,5,3,6])
    XCTAssertEqual(findDiagonalOrder(b), [1,2,3])
    XCTAssertEqual(findDiagonalOrder(c), [1,2,3])
  }
  
  func testSpiralOrder() {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
      let m = matrix.count
      guard let n = matrix.first?.count else { return [] }
      let totalCount = m * n
      var mutableMatrix = matrix
      var array = [Int]()
      while totalCount > array.count {
        // →
        array.append(contentsOf: mutableMatrix[0])
        mutableMatrix.remove(at: 0)
        if array.count == totalCount { break }
        // ↓
        array.append(contentsOf: mutableMatrix.map {
          $0.last!
        })
        mutableMatrix = mutableMatrix.map {
          var m = $0
          m.removeLast()
          return m
        }
        if array.count == totalCount { break }
        // ←
        array.append(contentsOf: mutableMatrix.last!.reversed())
        mutableMatrix.removeLast()
        if array.count == totalCount { break }
        // ↑
        let firstArray = mutableMatrix.map { $0.first! }
        array.append(contentsOf: firstArray.reversed())
        mutableMatrix = mutableMatrix.map {
          var m = $0
          m.removeFirst()
          return m
        }
      }
      return array
    }
    
    XCTAssertEqual(spiralOrder(a), [1,2,3,6,9,8,7,4,5])
    XCTAssertEqual(spiralOrder(a1), [1, 2, 3, 6, 5, 4])
    XCTAssertEqual(spiralOrder(b), [1,2,3])
    XCTAssertEqual(spiralOrder(c), [1,2,3])
  }
  
  func testSpiralOrder1() {
    func spiralOrder1(_ matrix: [[Int]]) -> [Int] {
      let m = matrix.count
      guard let n = matrix.first?.count else { return [] }
      let totalCount = m * n
      var l = 0
      var r = n - 1
      var t = 0
      var b = m - 1
      var array = [Int]()
      while totalCount > array.count {
        // →
        for i in l...r {
          array.append(matrix[t][i])
        }
        t += 1
        if array.count == totalCount { break }
        // ↓
        for i in t...b {
          array.append(matrix[i][r])
        }
        r -= 1
        if array.count == totalCount { break }
        // ←
        for i in l...r {
          let index = (l + r) - i
          array.append(matrix[b][index])
        }
        b -= 1
        if array.count == totalCount { break }
        // ↑
        for i in t...b {
          let index = (t + b) - i
          array.append(matrix[index][l])
        }
        l += 1
      }
      return array
    }
    
    XCTAssertEqual(spiralOrder1(a), [1,2,3,6,9,8,7,4,5])
    XCTAssertEqual(spiralOrder1(a1), [1, 2, 3, 6, 5, 4])
    XCTAssertEqual(spiralOrder1(b), [1,2,3])
    XCTAssertEqual(spiralOrder1(c), [1,2,3])
  }
  
  func testGenerate() {
    func generate(_ numRows: Int) -> [[Int]] {
      if numRows == 0 { return [] }
      var array: [[Int]] = [[1]]
      for i in 1..<numRows {
        var rowArray = [Int]()
        for j in 0...i {
          var num = 1
          if j > 0 && j < i {
            num = array[i - 1][j - 1] + array[i - 1][j]
          }
          rowArray.append(num)
        }
        array.append(rowArray)
      }
      return array
    }
    
    XCTAssertEqual(generate(0), [])
    XCTAssertEqual(generate(1), [[1]])
    XCTAssertEqual(generate(5), [
        [1],
       [1,1],
      [1,2,1],
     [1,3,3,1],
    [1,4,6,4,1]
    ])
  }
}
