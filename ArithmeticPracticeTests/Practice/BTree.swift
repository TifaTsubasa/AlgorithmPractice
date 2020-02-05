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
//    static func buildTree(array: [Int]) -> TreeNode? {
//        if array.count == 0 { return nil }
//
//    }
    
    static func flatTree(root: TreeNode?) -> [Int?] {
        if root == nil { return [] }
        var arr: [Int?] = [Int]()
        var queue: [TreeNode?] = [root]
        var emptyNodeCount = 0
        while !queue.isEmpty {
            print(queue)
            let count = queue.count
            if (count > 0) && (((count & (count - 1)) == 0)) && count == emptyNodeCount {
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
    
    static func addFlatNode(node: TreeNode?, to array: inout [Int?]) {
        if let val = node?.val {
            array.append(val)
        } else {
            array.append(nil)
        }
        if node?.left == nil && node?.right == nil { return }
        addFlatNode(node: node?.left, to: &array)
        addFlatNode(node: node?.right, to: &array)
    }
}

class BTreeTest: XCTestCase {
    
    func testFlatBTree() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)
        
        node1.left = node2
        node1.right = node3
        
        node2.left = node4
        
        XCTAssertEqual(BTree.flatTree(root: node1), [1, 2, 3, 4, nil, nil, nil])
    }

    
}
