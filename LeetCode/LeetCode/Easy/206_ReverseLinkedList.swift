//
//  206_ReverseLinkedList.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/5/23.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation

/*
 Reverse a singly linked list.   单链表反转
 */

class Problem206Solution1 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        let dumbNode = ListNode(-1)
        var oldHead = head
        var tmp: ListNode?
        while oldHead != nil {
            tmp = dumbNode.next
            dumbNode.next = oldHead
            oldHead = oldHead?.next
            dumbNode.next?.next = tmp
        }
        return dumbNode.next
    }
}
