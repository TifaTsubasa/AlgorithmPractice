//
//  BTree.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/2/4.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class TreeNode: CustomStringConvertible {
    var description: String {
        return "\(val)"
    }
    
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class BTree {
    static func buildTree(array: [Int?]) -> TreeNode? {
        if array.first == nil { return nil }
        let root = TreeNode(array[0]!)
        var level = [root]
        for i in 1..<array.count {
            
        }
        
        return nil
    }
    
    static func flatTree(root: TreeNode?) -> [Int?] {
        if root == nil { return [] }
        var arr: [Int?] = [Int]()
        var queue: [TreeNode?] = [root]
        var emptyNodeCount = 0
        while !queue.isEmpty {
            let count = queue.count
            if (((count & (count - 1)) == 0)) &&
                count == emptyNodeCount {
                break
            }
            let firstNode = queue.first
            arr.append(firstNode??.val)
            queue.removeFirst()
            
            if firstNode??.val == nil {
                emptyNodeCount -= 1
            }
            
            queue.append(firstNode??.left)
            if firstNode??.left == nil { emptyNodeCount += 1}
            queue.append(firstNode??.right)
            if firstNode??.right == nil { emptyNodeCount += 1}
        }
        
        return arr
    }
}

class BTreeTest: XCTestCase {
    
    func testFlatBTree() {
        XCTContext.runActivity(named: "1, 2, 3, 4, nil, nil, nil") { _ in
            let node1 = TreeNode(1)
            let node2 = TreeNode(2)
            let node3 = TreeNode(3)
            let node4 = TreeNode(4)
            
            node1.left = node2
            node1.right = node3
            
            node2.left = node4
            
            XCTAssertEqual(BTree.flatTree(root: node1), [1, 2, 3, 4, nil, nil, nil])
        }
        XCTContext.runActivity(named: "1, 2, 3, 4, nil, 5, nil") { _ in
            let node1 = TreeNode(1)
            let node2 = TreeNode(2)
            let node3 = TreeNode(3)
            let node4 = TreeNode(4)
            let node5 = TreeNode(5)
            
            node1.left = node2
            node1.right = node3
            
            node2.left = node4
            node3.left = node5
            
            XCTAssertEqual(BTree.flatTree(root: node1), [1, 2, 3, 4, nil, 5, nil])
        }
    }
    
    func testBuildTree() {
        XCTContext.runActivity(named: "1, 2, 3, 4, nil, nil, nil") { _ in
            let node = BTree.buildTree(array: [1, 2, 3, 4, nil, nil, nil])
            XCTAssertEqual(node?.val, 1)
            XCTAssertEqual(node?.left?.val, 2)
            XCTAssertEqual(node?.right?.val, 3)
            XCTAssertEqual(node?.left?.left?.val, 4)
            XCTAssertEqual(node?.left?.right?.val, nil)
        }
        XCTContext.runActivity(named: "1, 2, 3, 4, nil, 5, nil") { _ in
            let node = BTree.buildTree(array: [1, 2, 3, 4, nil, 5, nil])
            XCTAssertEqual(node?.val, 1)
            XCTAssertEqual(node?.left?.val, 2)
            XCTAssertEqual(node?.right?.val, 3)
            XCTAssertEqual(node?.left?.left?.val, 4)
            XCTAssertEqual(node?.left?.right?.val, nil)
            XCTAssertEqual(node?.right?.left?.val, 5)
            XCTAssertEqual(node?.right?.right?.val, nil)
        }
    }
}
