//
//  n102.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/2/4.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n102: XCTestCase {
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var array = [[Int]]()
        
        helper(node: root, level: 0, array: &array)

        return array
    }
    
    func helper(node: TreeNode, level: Int, array: inout [[Int]]) {
        if level == array.count {
            array.append([])
        }
        array[level].append(node.val)
        if let leftNode = node.left {
            helper(node: leftNode, level: level + 1, array: &array)
        }
        if let rightNode = node.right {
            helper(node: rightNode, level: level + 1, array: &array)
        }
    }
    
    func levelOrder1(_ root: TreeNode?) -> [[Int]] {
        if root == nil { return [] }
        var curNodes: [TreeNode?] = []
        var preNodes: [TreeNode?] = [root]
        var isNotEnd = true
        var array = [[Int]]()
        while isNotEnd {
            var vals = [Int]()
            isNotEnd = false
            for node in preNodes {
                if let val = node?.val {
                    vals.append(val)
                    print(val)
                }
                if node?.left != nil || node?.right != nil {
                    isNotEnd = true
                }
                curNodes.append(node?.left)
                curNodes.append(node?.right)
            }
            array.append(vals)
            preNodes = curNodes
            curNodes = []
        }
        return array
    }

    func testExample() {
        XCTContext.runActivity(named: "empty root") { _ in
            XCTAssertEqual(levelOrder(nil), [])
        }
        XCTContext.runActivity(named: "1, 2 3, 4") { _ in
            let node1 = TreeNode(1)
            let node2 = TreeNode(2)
            let node3 = TreeNode(3)
            let node4 = TreeNode(4)
            
            node1.left = node2
            node1.right = node3
            
            node2.left = node4
            XCTAssertEqual(levelOrder(node1), [[1], [2, 3], [4]])
        }
        XCTContext.runActivity(named: "3, 9 20, 15 7") { _ in
            let node3 = TreeNode(3)
            let node9 = TreeNode(9)
            let node20 = TreeNode(20)
            let node15 = TreeNode(15)
            let node7 = TreeNode(7)
            
            node3.left = node9
            
            node3.right = node20
            node20.left = node15
            node20.right = node7
            
            XCTAssertEqual(levelOrder(node3), [[3], [9, 20], [15, 7]])
        }
    }

}
