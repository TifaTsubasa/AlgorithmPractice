//
//  n77.swift
//  AlgorithmPracticeTests
//
//  Created by upmer on 2020/2/18.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n77: XCTestCase {

    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        if k == 0 { return [] }
        var res = [[Int]]()
        var kind = [Int]()
        backtrack(res: &res, kind: &kind, n: n, k)
        
        return res
    }
    
    func backtrack(res: inout [[Int]], kind: inout [Int], n: Int, _ k: Int) {
        if kind.count == k {
            res.append(kind)
            return
        }
        for i in 1...n {
            print(i, kind)
            if kind.contains(i) {
                continue
            }
            kind.append(i)
            backtrack(res: &res, kind: &kind, n: n, k)
            kind.removeLast()
        }
    }
    
    func testCase() {
        XCTAssertEqual(combine(4, 2), [
          [2,4],
          [3,4],
          [2,3],
          [1,2],
          [1,3],
          [1,4],
        ])
    }


    func testExample() {
        XCTAssertEqual(combine(4, 0), [])
        XCTAssertEqual(combine(4, 1), [[1],[2],[3],[4]])
        XCTAssertEqual(combine(4, 2), [
          [2,4],
          [3,4],
          [2,3],
          [1,2],
          [1,3],
          [1,4],
        ])
        XCTAssertEqual(combine(3, 2), [
            [1,2],
            [2,3],
            [1,3]
        ])
    }

}
