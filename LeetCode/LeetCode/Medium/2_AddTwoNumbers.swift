//
//  2_AddTwoNumbers.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/9/30.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation

/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 */


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




/// 挺简单的一道题, 主要就是累加每一位数字,然后进位即可.   88ms
class Problem2Solution1 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1, list2 = l2
        let dummy = ListNode(0)
        var currentPointer: ListNode? = dummy
        var carry = 0
        
        while list1 != nil || list2 != nil {
            let num = (list1?.val ?? 0) + (list2?.val ?? 0) + carry
            carry = num / 10
            let node = ListNode(num % 10)
            currentPointer?.next = node
            currentPointer = currentPointer?.next
            list1 = list1?.next
            list2 = list2?.next
        }
        if carry > 0 {currentPointer?.next = ListNode(1)}
        return dummy.next
    }
}




/// 不算是新的解法, 但是解题时间为72ms.  因为这里使用了iflet, 而上面使用了??解包. 猜测使用iflet更快的原因是, 如果遇到=nil则会中断操作,而使用??遇到nill也会继续赋值为0,然后继续执行,语句执行量更多了一点点, 因此会有十几毫秒的差别.
class Problem2Solution2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1, list2 = l2
        let dummy = ListNode(0)
        var currentPointer: ListNode? = dummy
        var carry = 0
        
        while list1 != nil || list2 != nil {
            var sum = carry
            if let val1 = list1?.val {
                sum += val1
            }
            if let val2 = list2?.val {
                sum += val2
            }
            
            carry = sum / 10
            currentPointer?.next = ListNode(sum % 10)
            currentPointer = currentPointer?.next
            list1 = list1?.next
            list2 = list2?.next
        }
        if carry > 0 {currentPointer?.next = ListNode(1)}
        return dummy.next
    }
}










