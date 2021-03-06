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
            var pre: Double = 1
            for i in 1...k {
                res = pre * Double(n - k + i) / Double(i)
                pre = res
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
    
    func testReverseWords1() {
        func reverseWords(_ s: String) -> String {
            let stringArray = s.map { $0 }
            let count = stringArray.count
            var res = ""
            var word = ""
            for i in 0...(count) {
                let index = count - i - 1
                if i == count || stringArray[index] == " " {
                    if word.count > 0 {
                        res += "\(word) "
                    }
                    word = ""
                } else {
                    word = "\(stringArray[index])\(word)"
                }
            }
            if res.hasSuffix(" ") {
                res.removeLast()
            }
            return res
        }
        XCTAssertEqual(reverseWords(""), "")
        XCTAssertEqual(reverseWords("the sky is blue"), "blue is sky the")
        XCTAssertEqual(reverseWords("  hello world!  "), "world! hello")
        XCTAssertEqual(reverseWords("a good   example"), "example good a")
    }
    
    func testReverseWords2() {
        func reverseWords(_ s: String) -> String {
            let stringArray = Array(s)
            let count = stringArray.count
            var words = [String]()
            var word = [String]()
            for i in 0...(stringArray.count) {
                if i == count || stringArray[i] == " " {
                    guard word.count > 0 else { continue }
                    words.append(word.joined())
                    if i < count - 1 { words.append(" ") }
                    word = [String]()
                } else {
                    word.insert(String(stringArray[i]), at: 0)
                }
            }
            return words.joined()
        }
        XCTAssertEqual(reverseWords(""), "")
        XCTAssertEqual(reverseWords("Let's take LeetCode contest"), "s'teL ekat edoCteeL tsetnoc" )
        XCTAssertEqual(reverseWords(" Let's  take LeetCode contest "), "s'teL ekat edoCteeL tsetnoc" )
    }
    
    func testRemoveDuplicates() {
        func removeDuplicates(_ nums: inout [Int]) -> Int {
            if nums.count <= 1 { return nums.count }
            var index = 1
            var value = nums.first!
            for i in 1..<(nums.count) {
                let num = nums[i]
                if num > value {
                    nums[index] = num
                    index += 1
                    value = num
                }
            }
            return index
        }
        var num1 = [1,1,2]
        var num2 = [0,0,1,1,1,2,2,3,3,4]
        var num3 = [0]
        var num4: [Int] = []
        XCTAssertEqual(removeDuplicates(&num1), 2)
        XCTAssertEqual(num1.prefix(2), [1, 2])
        XCTAssertEqual(removeDuplicates(&num2), 5)
        XCTAssertEqual(num2.prefix(5), [0, 1, 2, 3, 4])
        XCTAssertEqual(removeDuplicates(&num3), 1)
        XCTAssertEqual(num3.prefix(1), [0])
        XCTAssertEqual(removeDuplicates(&num4), 0)
        XCTAssertEqual(num4, [])
    }
    
    func testMoveZeroes() {
        func moveZeroes(_ nums: inout [Int]) {
            var zeroes: [Int] = []
            var index = 0
            while index < nums.count {
                let num = nums[index]
                if num == 0 {
                    zeroes.append(num)
                    nums.remove(at: index)
                } else {
                    index += 1
                }
            }
            nums.append(contentsOf: zeroes)
        }
        var num1 = [0,1,0,3,12]
        moveZeroes(&num1)
        var num2: [Int] = []
        moveZeroes(&num2)
        var num3 = [1, 3,12]
        moveZeroes(&num3)
        XCTAssertEqual(num1, [1,3,12,0,0])
        XCTAssertEqual(num2, [])
        XCTAssertEqual(num3, [1, 3,12])
    }
}
