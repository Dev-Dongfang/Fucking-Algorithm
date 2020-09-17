//
//  Problem6.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/10.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation


/**
 剑指 Offer 06. 从尾到头打印链表
 输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。
 */

/**
 解决方案1：使用栈结构，顺序遍历入栈，最后以此遍历出栈big输出。
 解决方案2：递归打印。
 */
class Problem6 {
    
    func reversePrint(_ head: ListNode?) -> [Int] {
        var res = [Int]()
        func recur(node: ListNode?) {
            guard let node = node else { return }
            
            recur(node: node.next)
            res.append(node.val)
        }
        recur(node: head)
        return res
    }
}
