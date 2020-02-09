//
//  n43.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/2/7.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n43: XCTestCase {
    
    func multiply(_ num1: String, _ num2: String) -> String {
        let num1 = Array(num1)
        let num2 = Array(num2)
        
        let count = num1.count + num2.count
        var res = Array(repeating: 0, count: count)
        for i in 0..<num1.count {
            let n1 = num1[num1.index(num1.startIndex, offsetBy: num1.count - i - 1)]
            for j in 0..<num2.count {
                let n2 = num2[num2.index(num2.startIndex, offsetBy: num2.count - j - 1)]
                let sum = (Int(String(n1))! * Int(String(n2))!)
                helper(num: sum, location: i + j, arr: &res)
                print(i, j, sum, res)
            }
            
        }
        while res.first == 0 {
            res.removeFirst()
        }
        return res.count == 0 ? "0" : res.map { String($0) }.joined()
    }
    
    func helper(num: Int, location: Int, arr: inout [Int]) {
        var index = arr.count - location - 1
        let sum = arr[index] + num
        arr[index] = sum % 10
        var step = sum / 10
        while step > 0 {
            index -= 1
            let n = arr[index] + step
            arr[index] = n % 10
            step = n / 10
        }
    }
    
    func testHelper() {
        XCTContext.runActivity(named: "12 + 2") { _ in
            var a = [1, 2]
            helper(num: 2, location: 0, arr: &a)
            XCTAssertEqual(a, [1, 4])
        }
        XCTContext.runActivity(named: "55 + 26") { _ in
            var a = [5, 5]
            helper(num: 26, location: 0, arr: &a)
            XCTAssertEqual(a, [8, 1])
        }
        XCTContext.runActivity(named: "77 + 77") { _ in
            var a = [0, 7, 7]
            helper(num: 77, location: 0, arr: &a)
            XCTAssertEqual(a, [1, 5, 4])
        }
    }

    func testExample() {
        XCTAssertEqual(multiply("1", "222"), "222")
        XCTAssertEqual(multiply("222", "1"), "222")
        XCTAssertEqual(multiply("6", "222"), "1332")
        XCTAssertEqual(multiply("222", "6"), "1332")
        XCTAssertEqual(multiply("22", "22"), "484")
        XCTAssertEqual(multiply("55", "55"), "3025")
        XCTAssertEqual(multiply("2", "3"), "6")
        XCTAssertEqual(multiply("123", "456"), "56088")
        XCTAssertEqual(multiply("0", "1"), "0")
        XCTAssertEqual(multiply("1", "0"), "0")
        XCTAssertEqual(multiply("0", "0"), "0")
        XCTAssertEqual(multiply("0", "0"), "0")
        XCTAssertEqual(multiply("9999", "0"), "0")
    }
}
