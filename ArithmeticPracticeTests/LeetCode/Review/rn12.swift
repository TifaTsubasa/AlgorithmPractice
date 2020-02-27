//
//  rn12.swift
//  AlgorithmPracticeTests
//
//  Created by upmer on 2020/2/18.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class rn12: XCTestCase {
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        var trackedWord = ""
        
        return false
    }
    
    func backtrack(_ board: [[Character]], character: Character, trackedWord: inout String) {
        trackedWord.append(character)
        
        
        
        trackedWord.removeLast()
    }
    
    func hasNextStep(_ board: [[Character]], index: (Int, Int), nextCharacter: Character) -> (Int, Int) {
        
        return (-1, -1)
    }
    
    func testCase() {
        XCTAssertEqual(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"), true)
    }
    
    func testExample() {
        XCTAssertEqual(exist([], ""), true)
        XCTAssertEqual(exist([], "1"), false)
        XCTAssertEqual(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"), true)
        XCTAssertEqual(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ADF"), true)
        XCTAssertEqual(exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ADFS"), true)
        XCTAssertEqual(exist([["a","b"],["c","d"]], "abcd"), false)
    }
    
}
