//
//  n144.swift
//  AlgorithmPracticeTests
//
//  Created by upmer on 2020/2/27.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n144: XCTestCase {
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        record(root: root, res: &res)
        return res
    }
    
    func record(root: TreeNode?, res: inout [Int]) {
        if root == nil { return }
        if let value = root?.val {
            res.append(value)
        }
        record(root: root?.left, res: &res)
        record(root: root?.right, res: &res)
    }

    func testExample() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        node1.right = node2
        node2.left = node3
        XCTAssertEqual(preorderTraversal(node1), [1, 2, 3])
    }

}
