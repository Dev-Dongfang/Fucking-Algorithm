//
//  Tools.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/9.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation


//MARK: - 定义一个单链表的节点
class ListNode{
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
    }
    
    /// 将数组转换成链表，方便构建链表
    static func convertToListNodeFrom(_ arr: [Int]) -> ListNode? {
        let dump = ListNode(-1)
        var currentNode = dump
        for item in arr {
            currentNode.next = ListNode(item)
            currentNode = currentNode.next!
        }
        return dump.next
    }
}

extension ListNode: CustomStringConvertible {
    // 打印整个链表
    var description: String {
        var desc = val.description
        var node = next
        while node != nil {
            desc += "->" + node!.val.description
            node = node?.next
        }
        return desc
    }
}




//MARK: - 二叉树节点
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    /// 使用数组构建一个二叉树，数组为后序遍历结果
    static func convertToBinaryTree(from arr: [Int], index: Int) -> TreeNode? {
        guard index < arr.count else { return nil }
        
        //构建当前节点，构建当前节点左子树，构建当前节点右子树，递归创建
        let node = TreeNode(arr[index])
        node.left = convertToBinaryTree(from: arr, index: 2 * index + 1)
        node.right = convertToBinaryTree(from: arr, index: 2 * index + 2)
        
        return node
    }
    /// 输出前序遍历结果
    func printDLR(_ node: TreeNode?) -> String {
        guard node != nil else { return "_" }
        let leftVals = printDLR(node?.left)
        let rightVals = printDLR(node?.right)
        return "\(node!.val) \(leftVals) \(rightVals)"
    }
    ///输出中序遍历结果
    func printLDR(_ node: TreeNode?) -> String {
        guard node != nil else { return "_" }
        let leftVals = printLDR(node?.left)
        let rightVals = printLDR(node?.right)
        return " \(leftVals) \(node!.val) \(rightVals)"
    }
    ///输出后序遍历结果
    func printLRD(_ node: TreeNode?) -> String {
        guard node != nil else { return "_" }
        let leftVals = printLRD(node?.left)
        let rightVals = printLRD(node?.right)
        return " \(leftVals) \(rightVals) \(node!.val)"
    }
}





//MARK: - 使用数组实现一个栈
class Stack<Value> {
    private var container = [Value]()
    
    var count: Int {
        return container.count
    }
    
    func pop() -> Value? {
        return container.popLast()
    }
    
    func push(_ val: Value) {
        container.append(val)
    }
    
    func peek() -> Value? {
        return container.last
    }
}

//MARK: - 实现一个队列
class Queue<Value> {
    private var pushStack = Stack<Value>()
    private var popStack = Stack<Value>()
    
    var isEmpty: Bool {
        return pushStack.count == 0 && popStack.count == 0
    }
    
    func push(_ val: Value) {
        pushStack.push(val)
    }
    
    func pop() -> Value? {
        if popStack.count == 0 {
            move()
        }
        return popStack.pop()
    }
    
    private func move() {
        while let val = pushStack.pop() {
            popStack.push(val)
        }
    }
}
