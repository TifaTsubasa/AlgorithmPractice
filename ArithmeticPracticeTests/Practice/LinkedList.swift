//
//  LinkedList.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2019/11/28.
//  Copyright © 2019 upmer. All rights reserved.
//
// start : Thu Nov 28 14:17:50 CST 2019
// end:

import XCTest

class LinkedList<T: Equatable> {
    var header: LinkedNode<T>?
    
    var size: Int {
        get {
            if header == nil { return 0 }
            var count = 0
            var next = header
            while next != nil {
                count += 1
                next = next?.next
            }
            return count
        }
    }
    
    func node(value: T) -> LinkedNode<T>? {
        return nil
    }
    
    func node(at index: Int) -> LinkedNode<T>? {
        var vernier = header
        for _ in 0..<index {
            vernier = vernier?.next
        }
        return vernier
    }
    
    func insert(element: T, at index: Int) {
        let node = LinkedNode(value: element)
        insert(node: node, at: index)
    }
    
    func insert(node: LinkedNode<T>, at index: Int) {
        if header == nil {
            header = node
            return
        }
        if index == 0 {
            node.next = header
            header = node
            return
        }
        var vernier = header // previous node
        for _ in 0..<(index - 1) {
            if vernier?.next == nil { break }
            vernier = vernier?.next
        }
        node.next = vernier?.next
        vernier?.next = node
    }
    
    func insert(node: LinkedNode<T>, before: LinkedNode<T>) {
        if header?.value == before.value {
            node.next = header
            header = node
            return
        }
        let previous = previousNode(before: before)
        node.next = previous?.next
        previous?.next = node
    }
    
    func insert(node: LinkedNode<T>, after: LinkedNode<T>) {
        node.next = after.next
        after.next = node
    }
    
    func delete(element: T) {
        let node = LinkedNode(value: element)
        delete(node: node)
    }
    
    func delete(node: LinkedNode<T>) {
        if header?.value == node.value {
            header = header?.next
            return
        }
        let previous = previousNode(before: node)
        previous?.next = previous?.next?.next
    }
    
    private func previousNode(before node: LinkedNode<T>) -> LinkedNode<T>? {
        var previous = header
        while previous?.next != nil {
            if previous?.next?.value == node.value { return previous }
            previous = previous?.next
        }
        return previous
    }
}

class LinkedNode<T: Equatable> {
    var value: T?
    var next: LinkedNode?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedListTest: XCTestCase {
    
    override func setUp() { }
    
    override func tearDown() { }
    
    func testInsert() {
        XCTContext.runActivity(named: "[] insert at 0 -> [1]") { _ in
            let list = LinkedList<Int>()
            let element = 1
            list.insert(element: element, at: 0)
            XCTAssertEqual(list.size, 1)
            XCTAssertEqual(list.node(at: 0)?.value, element)
            XCTAssertEqual(list.header?.value, element)
        }
        XCTContext.runActivity(named: "[] insert at 3 -> [1]") { _ in
            let list = LinkedList<Int>()
            let element = 1
            list.insert(element: element, at: 3)
            XCTAssertEqual(list.size, 1)
            XCTAssertEqual(list.node(at: 0)?.value, element)
            XCTAssertEqual(list.header?.value, element)
        }
        XCTContext.runActivity(named: "[2] insert at 0 -> [1,2]") { _ in
            let list = LinkedList<Int>()
            list.insert(element: 2, at: 0)
            let element = 1
            list.insert(element: element, at: 0)
            XCTAssertEqual(list.size, 2)
            XCTAssertEqual(list.header?.value, element)
            XCTAssertEqual(list.node(at: 0)?.value, element)
        }
        XCTContext.runActivity(named: "[1,2] insert at 4 -> [1,2,3]") { _ in
            let list = LinkedList<Int>()
            list.insert(element: 1, at: 0)
            list.insert(element: 2, at: 1)
            let element = 3
            list.insert(element: element, at: 4)
            XCTAssertEqual(list.size, 3)
            XCTAssertEqual(list.node(at: 2)?.value, element)
        }
        XCTContext.runActivity(named: "[1,3] insert at 1 -> [1,2,3]") { _ in
            let list = LinkedList<Int>()
            list.insert(element: 1, at: 0)
            list.insert(element: 3, at: 1)
            let element = 2
            list.insert(element: element, at: 1)
            XCTAssertEqual(list.size, 3)
            XCTAssertEqual(list.node(at: 1)?.value, element)
        }
    }
    
    func testInsertBefore() {
        XCTContext.runActivity(named: "[1,2] insert 0 before 1 -> [0,1,2]") { _ in
            let list = LinkedList<Int>()
            let node1 = LinkedNode(value: 1)
            list.insert(node: node1, at: 0)
            list.insert(element: 2, at: 1)
            let node = LinkedNode(value: 0)
            list.insert(node: node, before: node1)
            XCTAssertEqual(list.header?.value, node.value)
            XCTAssertEqual(list.node(at: 0)?.value, node.value)
            XCTAssertEqual(list.node(at: 1)?.value, 1)
        }
        XCTContext.runActivity(named: "[1,3] insert 2 before 3 -> [1,2,3]") { _ in
            let list = LinkedList<Int>()
            let node3 = LinkedNode(value: 3)
            list.insert(element: 1, at: 0)
            list.insert(node: node3, at: 2)
            let node = LinkedNode(value: 2)
            list.insert(node: node, before: node3)
            XCTAssertEqual(list.node(at: 1)?.value, node.value)
        }
    }
    
    func testInsertAfter() {
        XCTContext.runActivity(named: "[1,2] insert after 2") { _ in
            let list = LinkedList<Int>()
            list.insert(element: 1, at: 0)
            let node2 = LinkedNode(value: 2)
            list.insert(node: node2, at: 1)
            let node = LinkedNode(value: 3)
            list.insert(node: node, after: node2)
            XCTAssertEqual(list.header?.value, 1)
            XCTAssertEqual(list.node(at: 2)?.value, node.value)
            XCTAssertEqual(list.node(at: 1)?.value, 2)
        }
        XCTContext.runActivity(named: "[1,3] insert after 1") { _ in
            let list = LinkedList<Int>()
            let node1 = LinkedNode(value: 1)
            list.insert(node: node1, at: 0)
            list.insert(element: 3, at: 1)
            let node = LinkedNode(value: 2)
            list.insert(node: node, after: node1)
            XCTAssertEqual(list.node(at: 1)?.value, node.value)
        }
    }
    
    func testDelete() {
        XCTContext.runActivity(named: "[1, 2, 3] delete 1") { _ in
            let list = LinkedList<Int>()
            list.insert(element: 1, at: 0)
            list.insert(element: 2, at: 1)
            list.insert(element: 3, at: 2)
            list.delete(element: 1)
            XCTAssertEqual(list.size, 2)
            XCTAssertEqual(list.node(at: 0)?.value, 2)
            XCTAssertEqual(list.node(at: 1)?.value, 3)
        }
        XCTContext.runActivity(named: "[1, 2, 3] delete 2") { _ in
            let list = LinkedList<Int>()
            list.insert(element: 1, at: 0)
            list.insert(element: 2, at: 1)
            list.insert(element: 3, at: 2)
            list.delete(element: 2)
            XCTAssertEqual(list.size, 2)
            XCTAssertEqual(list.node(at: 0)?.value, 1)
            XCTAssertEqual(list.node(at: 1)?.value, 3)
        }
        XCTContext.runActivity(named: "[1, 2, 3] delete 3") { _ in
            let list = LinkedList<Int>()
            list.insert(element: 1, at: 0)
            list.insert(element: 2, at: 1)
            list.insert(element: 3, at: 2)
            list.delete(element: 3)
            XCTAssertEqual(list.size, 2)
            XCTAssertEqual(list.node(at: 0)?.value, 1)
            XCTAssertEqual(list.node(at: 1)?.value, 2)
        }
    }
}
