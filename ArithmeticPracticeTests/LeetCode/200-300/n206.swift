//
//  n206.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/2/9.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n206: XCTestCase {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head?.next == nil { return head }
        let p = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return p
    }
    
    func reverseList1(_ head: ListNode?) -> ListNode? {
        var pre: ListNode? = nil
        var cur = head
        while cur?.next != nil {
            let tmp = cur?.next
            cur?.next = pre
            
            pre = cur
            cur = tmp
        }
        cur?.next = pre
        return cur
    }
    func testExample() {
        let data = ListNode(1, next: ListNode(2, next: ListNode(3, next: ListNode(4, next: ListNode(5)))))
        let node = reverseList(data)
        XCTAssertEqual(node?.val, 5)
        XCTAssertEqual(node?.next?.val, 4)
        XCTAssertEqual(node?.next?.next?.val, 3)
        XCTAssertEqual(node?.next?.next?.next?.val, 2)
        XCTAssertEqual(node?.next?.next?.next?.next?.val, 1)
    }

}
