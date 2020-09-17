//
//  Tool.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/9/30.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation


/// 统计代码执行时长
///
/// - Parameter excuteCodes: 要执行的代码
public func excuteDuration(_ excuteCodes: () -> Void) {
    let startTime = CFAbsoluteTimeGetCurrent()
    excuteCodes()
    let endTime = CFAbsoluteTimeGetCurrent()
    print(String(format: "\tEXECUTE DURATION: %.4lfms", (endTime - startTime) * 1000))
}


/// 创建一个node结点
func createNode(nodes: [Int]) -> ListNode? {
    let dumbNode = ListNode(-1)
    var currentNode = dumbNode
    for value in nodes {
        currentNode.next = ListNode(value)
        currentNode = currentNode.next!
    }
    return dumbNode.next
}

/// 打印一个node
func printNodeList(node: ListNode?) {
    var result = ""
    var tmpNode = node
    while tmpNode != nil {
        result.append("\(tmpNode!.val) ")
        tmpNode = tmpNode?.next
    }
    if result.isEmpty {
        print("Nil ListNode")
    }else{
        print(result)
    }
}


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}





// 双向链表结点
final class Node<T: Equatable>: Equatable {
    var value: T
    var previous: Node<T>?
    var next: Node<T>?
    init(value: T) {
        self.value = value
    }
    
    public static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }
}



//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
