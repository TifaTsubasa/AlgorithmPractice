//
//  n101-SymmetricTree.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/2/4.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n101_SymmetricTree: XCTestCase {
    
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
    
    // Solution 1
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(t1: root, t2: root)
    }
    
    func isMirror(t1: TreeNode?, t2: TreeNode?) -> Bool {
        if t1 == nil && t2 == nil { return true }
        if t1 == nil || t2 == nil { return false }
        return t1?.val == t2?.val &&
            isMirror(t1: t1?.left, t2: t2?.right) &&
            isMirror(t1: t1?.right, t2: t2?.left)
    }
    
    // Solution 2
    func isSymmetric1(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        var preNodes: [TreeNode?] = [root]
        var currentNodes = [TreeNode?]()
        
        var isNotEnd = true
        while isNotEnd {
            // 当前层的所有node
            isNotEnd = false
            for node in preNodes {
                currentNodes.append(node?.left)
                currentNodes.append(node?.right)
                if node?.left != nil || node?.right != nil { isNotEnd = true } // 还有下一层
            }
            // 判断当前层的对称
            if !isSymmetric(nodes: currentNodes) { return false }
            preNodes = currentNodes
            currentNodes.removeAll()
        }
        return true
    }
    
    private func isSymmetric(nodes: [TreeNode?]) -> Bool {
        if nodes.count == 0 { return true }
        var left = 0
        var right = nodes.count - 1
        while left < right {
            if nodes[left]?.val != nodes[right]?.val { return false }
            left += 1
            right -= 1
        }
        return true
    }
    
    func testSymmetricNodes() {
        XCTContext.runActivity(named: "1 2 2 1") { _ in
            let nodes = [TreeNode(1), TreeNode(2), TreeNode(2), TreeNode(1)]
            XCTAssertEqual(isSymmetric(nodes: nodes), true)
        }
        XCTContext.runActivity(named: "1 2 1") { _ in
            let nodes = [TreeNode(1), TreeNode(2), TreeNode(1)]
            XCTAssertEqual(isSymmetric(nodes: nodes), true)
        }
        XCTContext.runActivity(named: "1 2 3 4 1") { _ in
            let nodes = [TreeNode(1), TreeNode(2), TreeNode(3), TreeNode(4), TreeNode(1)]
            XCTAssertEqual(isSymmetric(nodes: nodes), false)
        }
        XCTContext.runActivity(named: "1 nil nil 1") { _ in
            let nodes = [TreeNode(1), nil, nil, TreeNode(1)]
            XCTAssertEqual(isSymmetric(nodes: nodes), true)
        }
    }
    
    func testExample() {
    }
}
