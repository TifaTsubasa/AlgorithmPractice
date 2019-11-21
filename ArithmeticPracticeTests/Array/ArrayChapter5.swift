//
//  ArrayChapter5.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2019/11/20.
//  Copyright © 2019 upmer. All rights reserved.
//

import XCTest

class ArrayChapter5: XCTestCase {

    func testRotate() {
        func rotate(_ nums: inout [Int], _ k: Int) {
            if k == 0 { return }
            let count = nums.count
            let offset = k % count
            var suffixNums = [Int]()
            for _ in (count - offset)..<count {
                let num = nums.removeLast()
                suffixNums.insert(num, at: 0)
            }
            nums.insert(contentsOf: suffixNums, at: 0)
        }
        var a = [1,2,3,4,5,6,7]
        rotate(&a, 3)
        var b = [-1,-100,3,99]
        rotate(&b, 2)
        var c = [1,2,3,4,5,6,7]
        rotate(&c, 10)
        XCTAssertEqual(a, [5,6,7,1,2,3,4])
        XCTAssertEqual(b, [3,99,-1,-100])
        XCTAssertEqual(c, [5,6,7,1,2,3,4])
    }

    func testGetRow() {
        func solution1(_ rowIndex: Int) -> [Int] {
            if rowIndex == 0 { return [1] }
            var prevoiusRow = [1, 1]
            var array = [Int]()
            for i in 1...rowIndex {
                array = []
                for j in 0...i {
                    print(j)
                    if j == 0 || j == i {
                        array.append(1)
                    } else {
                        array.append(prevoiusRow[j - 1] + prevoiusRow[j])
                    }
                }
                prevoiusRow = array
            }
            return array
        }
        
        func solution2(_ rowIndex: Int) -> [Int] {
            if rowIndex == 0 { return [1] }
            var array = [1, 1]
            for _ in 1..<rowIndex {
                array.insert(1, at: 0)
                for j in 1..<(array.count - 1) {
                    array[j] = array[j] + array[j + 1]
                }
            }
            return array
        }
        
        func combination(k: Int, n: Int) -> Int {
            var res: Double = 1
            if k == 0 { return Int(res) }
            for i in 1...k {
                let cur: Double = Double(n - k + i) / Double(i)
                res *= cur
            }
            return Int(res)
        }
        
        func solution3(_ rowIndex: Int) -> [Int] {
            var array = [Int]()
            for i in 0...rowIndex {
                array.append(combination(k: i, n: rowIndex))
            }
            return array
        }

        func getRow(_ rowIndex: Int) -> [Int] {
           return solution3(rowIndex)
        }
        
        XCTAssertEqual(getRow(0), [1])
        XCTAssertEqual(getRow(1), [1, 1])
        XCTAssertEqual(getRow(2), [1, 2, 1])
        XCTAssertEqual(getRow(3), [1, 3, 3, 1])
        XCTAssertEqual(getRow(6), [1, 6, 15, 20, 15, 6, 1])
        
    }
}
