//
//  n51.swift
//  AlgorithmPracticeTests
//
//  Created by ByteDance on 2020/6/5.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n51: XCTestCase {
  
  func solveNQueens(_ n: Int) -> [[String]] {
    // 所有的决策情况
    var res = [[String]]()
    
    // 做哪一次决策
    func backtrack(_ row: Int, tracker: inout [[String]]) {
      // 满足条件，停止回溯
      if row == n {
        res.append(tracker.compactMap { $0.joined() })
        return
      }
      
      // 遍历这个决策的所有情况
      for col in 0..<n {
        // 跳过不合法的情况
        if !isValidate(row: row, col: col, board: tracker) {
          continue
        }
        // 做下决策
        tracker[row][col] = "Q"
        // 做下一步决策
        backtrack(row + 1, tracker: &tracker)
        // 撤回刚刚的决策
        tracker[row][col] = "."
      }
    }
    
    // 一次成功的决策
    var tracker = generateBoard(n)
    backtrack(0, tracker: &tracker)
    
    return res
  }
  
  func generateBoard(_ n: Int) -> [[String]] {
    var board = [[String]]()
    for _ in 0..<n {
      board.append(Array(repeating: ".", count: n))
    }
    return board
  }
  
  func isValidate(row: Int, col: Int, board: [[String]]) -> Bool {
    for i in 0..<row { // ????
      if board[i][col] == "Q" {
        return false
      }
    }
    var rowLimit = row - 1
    var colLimit = col - 1
    while rowLimit >= 0 && colLimit >= 0 { // 左上方
      if board[rowLimit][colLimit] == "Q" {
        return false
      }
      rowLimit -= 1
      colLimit -= 1
    }
    rowLimit = row - 1
    colLimit = col + 1
    while rowLimit >= 0 && colLimit < board.count { // 右上方
      if board[rowLimit][colLimit] == "Q" {
        return false
      }
      rowLimit -= 1
      colLimit += 1
    }
    return true
  }
  
  func testCase() {
    solveNQueens(4).forEach { print($0.joined(separator: ", ")) }
  }
  
  func testValidate() {
    let board = [
      [".", ".", "Q", ".", "."],
      [".", ".", "Q", ".", "."],
      [".", ".", ".", ".", "Q"],
      [".", ".", ".", "Q", "."],
      [".", "Q", ".", ".", "."],
    ]
    XCTAssertFalse(isValidate(row: 1, col: 2, board: board))
    XCTAssertFalse(isValidate(row: 2, col: 4, board: board))
    XCTAssertFalse(isValidate(row: 3, col: 3, board: board))
    XCTAssertTrue(isValidate(row: 4, col: 1, board: board))
  }
  
}
