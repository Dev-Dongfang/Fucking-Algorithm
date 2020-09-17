//
//  92_ReverseLinkedListII.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/6/6.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation



/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

/*
 这个问题可以分解成两个子问题: 查找位置, 反转链表
 
 这个问题时反转链表的变体, 解决方案看似简单, 但是实际上并没有那么简单.
 解法一: 1.先找到要反转的结点的前一个结点;2.依次反转每个结点, start指向反转的结点前一个结点,then指向被插入的结点,start.next指向then.next, pre.next指向then, then.next指向pre.next.
 */
class Problem92Solution1 {
    //反转链表的m~n
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        guard let head = head else { return nil }
        let dummy = ListNode(0)
        dummy.next = head
        var pre: ListNode? = dummy
        for _ in 1..<m {
            pre = pre?.next
        }
        
        let start = pre?.next
        var then = start?.next
        for _ in m..<n {
            start?.next = then?.next
            then?.next = pre?.next
            pre?.next = then
            then = start?.next
        }
        
        return dummy.next
    }
    
    // 反转链表
    func reverseLink(head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var headNode: ListNode? = head
        
        let dumb = ListNode(0)
        
        while headNode != nil {
            let tmp = dumb.next
            dumb.next = headNode
            headNode = headNode?.next
            dumb.next?.next = tmp
        }
        return dumb.next
    }
}
