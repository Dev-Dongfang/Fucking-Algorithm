//
//  876_MiddleoftheLinkedList.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/5/23.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation

/*
 Given a non-empty, singly linked list with head node head, return a middle node of linked list.
 
 If there are two middle nodes, return the second middle node.
 */

class Problem876Solution1 {
    /// 快慢指针解决
    func middleNode(_ head: ListNode?) -> ListNode? {
        var slowPointer: ListNode?, quickPointer: ListNode?
        (slowPointer, quickPointer) = (head, head)
        
        while quickPointer != nil && quickPointer?.next != nil {
            slowPointer = slowPointer?.next
            quickPointer = quickPointer?.next?.next
        }
        
        return slowPointer
    }
}
