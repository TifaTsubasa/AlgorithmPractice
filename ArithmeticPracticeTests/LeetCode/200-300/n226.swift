//
//  n226.swift
//  AlgorithmPracticeTests
//
//  Created by upmer on 2020/2/15.
//  Copyright © 2020 upmer. All rights reserved.
//

import XCTest

class n226: XCTestCase {
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        swap(node: root)
        return root
    }
    
    func swap(node: TreeNode?) {
        if node?.left == nil && node?.right == nil { return }
        let left = node?.left
        node?.left = node?.right
        node?.right = left
        swap(node: node?.left)
        swap(node: node?.right)
    }

    func testExample() {
        
    }

}
