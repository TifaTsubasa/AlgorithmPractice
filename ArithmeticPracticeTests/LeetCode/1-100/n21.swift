//
//  n21.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/2/9.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n21: XCTestCase {

    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        var i = l1
        var j = l2
        var cur: ListNode? = ListNode(0)
        let res: ListNode = cur!
        while i != nil || j != nil {
            if i == nil {
                cur?.next = j
                j = j?.next
            } else if j == nil {
                cur?.next = i
                i = i?.next
            } else {
                if i!.val <= j!.val {
                    cur?.next = i
                    i = i?.next
                } else {
                    cur?.next = j
                    j = j?.next
                }
            }
            cur = cur?.next
        }
        return res.next
    }

    func testExample() {
        XCTContext.runActivity(named: "nil") { _ in
            let node1: ListNode? = nil
            let node2 = ListNode(3, next: ListNode(4))
            let node = mergeTwoLists(node1, node2)
            XCTAssertEqual(node?.val, 3)
            XCTAssertEqual(node?.next?.val, 4)
        }
        XCTContext.runActivity(named: "nil") { _ in
            let node1 = ListNode(3, next: ListNode(4))
            let node2: ListNode? = nil
            let node = mergeTwoLists(node1, node2)
            XCTAssertEqual(node?.val, 3)
            XCTAssertEqual(node?.next?.val, 4)
        }
        XCTContext.runActivity(named: "normal case") { _ in
            let node1 = ListNode(1, next: ListNode(2, next: ListNode(4)))
            let node2 = ListNode(1, next: ListNode(3, next: ListNode(4)))
            let node = mergeTwoLists(node1, node2)
            XCTAssertEqual(node?.val, 1)
            XCTAssertEqual(node?.next?.val, 1)
            XCTAssertEqual(node?.next?.next?.val, 2)
            XCTAssertEqual(node?.next?.next?.next?.val, 3)
            XCTAssertEqual(node?.next?.next?.next?.next?.val, 4)
            XCTAssertEqual(node?.next?.next?.next?.next?.next?.val, 4)
        }
    }

}
