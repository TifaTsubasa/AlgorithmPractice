//
//  n146-LRU.swift
//  AlgorithmPracticeTests
//
//  Created by tsuf on 2020/2/3.
//  Copyright © 2020 upmer. All rights reserved.
//



import XCTest

class LRUCache {

    fileprivate class LRUCacheNode {
        var key: Int = 0
        var value: Int = 0
        var pre: LRUCacheNode?
        var next: LRUCacheNode?
        
        fileprivate static func delete(node: LRUCacheNode) {
            node.pre?.next = node.next
            node.next?.pre = node.pre
        }
        
        fileprivate static func insert(node: LRUCacheNode, before anchorNode: LRUCacheNode) {
            node.next = anchorNode
            anchorNode.pre?.next = node
            
            node.pre = anchorNode.pre
            anchorNode.pre = node
        }
    }

    private var cache = [Int: LRUCacheNode]()
    private var maxCount = 0
    private var head = LRUCacheNode()
    private var tail = LRUCacheNode()
    
    init(_ capacity: Int) {
        maxCount = capacity
        head.next = tail
        tail.pre = head
    }
    
    func get(_ key: Int) -> Int {
        defer {
            print("\(key): \(printCache())")
        }
        if maxCount <= 0 { return -1 }
        if let node = cache[key] {
            if node.next?.next == nil { return node.value } // last node
            LRUCacheNode.delete(node: node)
            LRUCacheNode.insert(node: node, before: tail)
            return node.value
        }
        
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if maxCount == 0 { return }
        if let node = cache[key] {
            node.value = value
            if node.next?.next == nil { return } // last node
            LRUCacheNode.delete(node: node)
        }
        if cache.count >= maxCount {
            // delete first
            let firstNode = head.next!
            LRUCacheNode.delete(node: firstNode)
            cache.removeValue(forKey: firstNode.key)
        }
        // insert
        let node = LRUCacheNode()
        node.key = key
        node.value = value
        cache[key] = node
        LRUCacheNode.insert(node: node, before: tail)
    }
    
    private func printCache() -> String {
        var i: LRUCacheNode? = head
        var str = ""
        while i != nil {
            str += " -> " + "\(i!.key)"
            i = i?.next
        }
        return str
    }
}

class n146_LRU: XCTestCase {
    func testExample() {
        XCTContext.runActivity(named: "0") { _ in
            let cache = LRUCache(0)
            cache.put(1, 1)
            XCTAssertEqual(cache.get(1), -1)
        }
        
        XCTContext.runActivity(named: "1") { _ in
            let cache = LRUCache(1)
            cache.put(1, 1)
            XCTAssertEqual(cache.get(1), 1)
            cache.put(2, 2)
            XCTAssertEqual(cache.get(2), 2)
        }
        
        XCTContext.runActivity(named: "normal case") { _ in
            let cache = LRUCache(2)
            cache.put(1, 1)
            cache.put(2, 2)
            cache.put(3, 3)
            XCTAssertEqual(cache.get(1), -1)
            XCTAssertEqual(cache.get(2), 2)
            XCTAssertEqual(cache.get(3), 3)
        }
        
        XCTContext.runActivity(named: "replace by get") { _ in
            let cache = LRUCache(2)
            cache.put(1, 1)
            cache.put(2, 2)
            let _ = cache.get(1)
            let _ = cache.get(2)
            cache.put(3, 3)
            XCTAssertEqual(cache.get(1), -1)
            XCTAssertEqual(cache.get(2), 2)
            XCTAssertEqual(cache.get(3), 3)
        }
        
        XCTContext.runActivity(named: "replace key value not full") { _ in
            let cache = LRUCache(2)
            cache.put(1, 2)
            cache.put(1, 3)
            XCTAssertEqual(cache.get(1), 3)
        }
    }
    
    func testCase1() {
        let cache = LRUCache(2)
        XCTAssertEqual(cache.get(2), -1)
        cache.put(2, 6)
        XCTAssertEqual(cache.get(1), -1)
        cache.put(1, 5)
        cache.put(1, 2)
        XCTAssertEqual(cache.get(1), 2)
        XCTAssertEqual(cache.get(2), 6)
    }
    
    func testCase2() {
        let cache = LRUCache(3)
        cache.put(1, 1)
        cache.put(2, 2)
        cache.put(3, 3) // 1 2 3
        cache.put(4, 4) // 2 3 4
        XCTAssertEqual(cache.get(4), 4) // 2 3 4
        XCTAssertEqual(cache.get(3), 3) // 2 4 3
        XCTAssertEqual(cache.get(2), 2) // 4 3 2
        XCTAssertEqual(cache.get(1), -1)
        cache.put(5, 5)
        XCTAssertEqual(cache.get(1), -1)
        XCTAssertEqual(cache.get(2), 2)
        XCTAssertEqual(cache.get(3), 3)
        XCTAssertEqual(cache.get(4), -1)
        XCTAssertEqual(cache.get(5), 5)
    }
    
    func testDeleteNode() {
        let node1 = LRUCache.LRUCacheNode()
        node1.key = 1
        let node2 = LRUCache.LRUCacheNode()
        node2.key = 2
        let node3 = LRUCache.LRUCacheNode()
        node3.key = 3
        
        node1.next = node2
        node2.next = node3
        
        node3.pre = node2
        node2.pre = node1
        LRUCache.LRUCacheNode.delete(node: node2)
        XCTAssertEqual(node1.next?.key, 3)
        XCTAssertEqual(node3.pre?.key, 1)
    }
    
    func testInserNode() {
        let node1 = LRUCache.LRUCacheNode()
        node1.key = 1
        let node2 = LRUCache.LRUCacheNode()
        node2.key = 2
        let node3 = LRUCache.LRUCacheNode()
        node3.key = 3
        
        node1.next = node3
        node3.pre = node1
        LRUCache.LRUCacheNode.insert(node: node2, before: node3)
        XCTAssertEqual(node1.next?.key, 2)
        XCTAssertEqual(node1.next?.next?.key, 3)
        XCTAssertEqual(node3.pre?.key, 2)
        XCTAssertEqual(node3.pre?.pre?.key, 1)
    }
}
