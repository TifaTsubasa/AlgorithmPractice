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
  
  func testFindDiagonalOrder() {
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
      let m = matrix.count
      let n = matrix.first?.count ?? 0
      if m == 0 || n == 0 { return [] }
      var point = (0, 0)
      var array = [Int]()
      while point.0 < m && point.1 < n  {
        array.append(matrix[point.0][point.1])
        
      }
      return array
    }
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
    XCTAssertEqual(findDiagonalOrder(a), [1,2,4,7,5,3,6,8,9])
    XCTAssertEqual(findDiagonalOrder(a1), [1,2,4,5,3,6])
    XCTAssertEqual(findDiagonalOrder(b), [1,2,3])
    XCTAssertEqual(findDiagonalOrder(c), [1,2,3])
  }
}
