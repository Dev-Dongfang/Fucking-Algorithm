//
//  146_LRUCache.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/5/28.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation


/*
 Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.
 
 get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
 put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.
 
 The cache is initialized with a positive capacity.
 
 Follow up:
 Could you do both operations in O(1) time complexity?
 
 Example:
 
 LRUCache cache = new LRUCache( 2 /* capacity */ );
 
 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // returns 1
 cache.put(3, 3);    // evicts key 2
 cache.get(2);       // returns -1 (not found)
 cache.put(4, 4);    // evicts key 1
 cache.get(1);       // returns -1 (not found)
 cache.get(3);       // returns 3
 cache.get(4);       // returns 4
 */



// 双向链表
final class DoublyLinkedList<T: Equatable> {
    var head: Node<T>?
    var tail: Node<T>?
    var count: Int = 0
    
    func addHead(value: T) -> Node<T> {
        let node = Node(value: value)
        defer {
            head = node
            count += 1
        }
        
        guard let _ = head else {
            tail = node
            return node
        }
        
        head?.previous = node
        node.next = head
        return node
    }
    
    func moveToHead(node: Node<T>) {
        guard node != head else { return }
        
        if node == tail {
            tail = node.previous
        }
        
        node.previous?.next = node.next
        node.next?.previous = node.previous
        
        node.previous = nil
        node.next = head
        node.next?.previous = node
        
        head = node
    }
    
    @discardableResult
    func removeTail() -> Node<T>? {
        guard let tail = tail else { return nil }
        
        self.tail = tail.previous
        tail.previous?.next = nil
        tail.previous = nil
        count -= 1
        
        if count == 0 {
            head = nil
        }
        
        return tail
    }
    
    func printLink() {
        var s = ""
        var node = head
        while node != nil {
            s.append("\(node?.value) ")
            node = node?.next
        }
        print(s)
    }
}

// LRU最近最少使用算法
class LRUCache {
    
    struct WrapValue: Equatable {
        var key: Int
        var value: Int
        
        public static func == (lhs: WrapValue, rhs: WrapValue) -> Bool {
            return lhs.key == rhs.key && lhs.value == rhs.value
        }
    }
    
    private var capacity: Int
    private let doublyList = DoublyLinkedList<WrapValue>()
    private var nodeDict = [Int: Node<WrapValue>]()
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let node = nodeDict[key] else { return -1 }
        doublyList.moveToHead(node: node)
        return node.value.value
    }
    
    // 先检查列表中是否存在, 不存在则创建后放在头部, 存在则重置到头部, 超过大小限制则先删除后存放
    func put(_ key: Int, _ value: Int) {
        let payload = WrapValue(key: key, value: value)
        if let node = nodeDict[key] {
            node.value = payload
            doublyList.moveToHead(node: node)
        }else{
            if capacity == doublyList.count {
                let tail = doublyList.removeTail()
                nodeDict.removeValue(forKey: tail!.value.key)
            }
            let node = doublyList.addHead(value: payload)
            nodeDict[key] = node
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */
