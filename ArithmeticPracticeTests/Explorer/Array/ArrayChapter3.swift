//
//  ArrayChapter3.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2019/11/15.
//  Copyright © 2019 upmer. All rights reserved.
//

import XCTest

class ArrayChapter3: XCTestCase {
  
  override func setUp() {}
  
  override func tearDown() {}
  
  func testAddBinary() {
    func addBinary(_ a: String, _ b: String) -> String {
      let aArray = a.map { String($0) }
      let bArray = b.map { String($0) }
      let maxCount = max(aArray.count, bArray.count)
      var result: String = ""
      var stepNum = 0
      for i in 0..<maxCount {
        let aIndex = aArray.count - i - 1
        let bIndex = bArray.count - i - 1
        let aNum = aIndex >= 0 ? aArray[aIndex] : "0"
        let bNum = bIndex >= 0 ? bArray[bIndex] : "0"
        var sum = (Int(aNum) ?? 0) + (Int(bNum) ?? 0) + stepNum
        if sum > 1 {
          stepNum = 1
          sum = sum - 2
        } else {
          stepNum = 0
        }
        result.insert(contentsOf: String(sum), at: result.startIndex)
      }
      if stepNum > 0 {
        result.insert(contentsOf: "1", at: result.startIndex)
      }
      return result
    }
    
    XCTAssertEqual(addBinary("1", "11"), "100")
    XCTAssertEqual(addBinary("11", "1"), "100")
    XCTAssertEqual(addBinary("1010", "1011"), "10101")
    XCTAssertEqual(addBinary(
      "10100000100100110110010000010101111011011001101110111111111101000000101111001110001111100001101",
      "110101001011101110001111100110001010100001101011101010000011011011001011101111001100000011011110011"),
                   "110111101100010011000101110110100000011101000101011001000011011000001100011110011010010011000000000")
  }
  
  
  func testLongestCommonPrefix() {
    func longestCommonPrefix(_ strs: [String]) -> String {
      if strs.count == 0 { return "" }
      let strArray = strs.map { $0.map { String($0) } }
      var prefix: String = ""
      var index = 0
      while index >= 0 {
        var prefixArray = [String]()
        for str in strArray {
          if index >= str.count {
            prefixArray = []
            break
          }
          let character = str[index]
          if !prefixArray.contains(character) {
            prefixArray.append(character)
          }
        }
        if prefixArray.count != 1 {
          break
        }
        index += 1
        prefix.append(prefixArray.first!)
      }
      return prefix
    }
      
    XCTAssertEqual(longestCommonPrefix(["flower","flow","flight"]), "fl")
    XCTAssertEqual(longestCommonPrefix(["dog","racecar","car"]), "")
    XCTAssertEqual(longestCommonPrefix(["racecar","","rar"]), "")
    XCTAssertEqual(longestCommonPrefix([]), "")
  }
}
