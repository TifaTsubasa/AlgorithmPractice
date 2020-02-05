//
//  BTree.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/2/4.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class TreeNode {
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
        
        addFlatNode(node: root, to: &arr)
        
        return arr
    }
    
    static func addFlatNode(node: TreeNode?, to array: inout [Int?]) {
        array.append(node?.val)
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
