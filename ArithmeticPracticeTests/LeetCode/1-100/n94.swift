//
//  n94.swift
//  AlgorithmPracticeTests
//
//  Created by upmer on 2020/2/27.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n94: XCTestCase {

    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        record(node: root, res: &res)
        return res
    }
    
    func record(node: TreeNode?, res: inout [Int]) {
        if node == nil { return }
        record(node: node?.left, res: &res)
        if let value = node?.val {
            res.append(value)
        }
        record(node: node?.right, res: &res)
    }

    func testExample() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        node1.right = node2
        node2.left = node3
        XCTAssertEqual(inorderTraversal(node1), [1, 3, 2])
    }

}
