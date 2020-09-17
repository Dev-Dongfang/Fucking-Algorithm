//
//  Problem24.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/9.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 问题：定义一个函数，输入一个链表的头节点，反转该链表并输出反转后链表的头节点。
 */


/**
 解决方案：
 反转链表，基本的链表操作，没有什么技巧而言，干就对了！
    头插法。
 */

class Problem24Solution1 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(-1)
        var current = head
        while current != nil {
            let tmp = dummy.next
            dummy.next = current
            current = current?.next
            dummy.next?.next = tmp
        }
        return dummy.next
    }
}
