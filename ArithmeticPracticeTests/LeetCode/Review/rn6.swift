//
//  rn6.swift
//  AlgorithmPracticeTests
//
//  Created by upmer on 2020/2/16.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class rn6: XCTestCase {
    
    func reversePrint(_ head: ListNode?) -> [Int] {
        var count = 0
        var node: ListNode? = head
        while node != nil {
            count += 1
            node = node?.next
        }
        
        var res = Array(repeating: 0, count: count)
        var index = count - 1
        node = head
        while node != nil {
            res[index] = node!.val
            index -= 1
            node = node?.next
        }
        return res
    }

    func testExample() {
        let node = ListNode(2, next: ListNode(3, next: ListNode(1)))
        XCTAssertEqual(reversePrint(node), [1, 3, 2])
        XCTAssertEqual(reversePrint(nil), [])
    }

}
