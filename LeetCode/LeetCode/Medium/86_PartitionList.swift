//
//  86_PartitionList.swift
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
 
 Given a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.
 
 You should preserve the original relative order of the nodes in each of the two partitions.
 
 Example:
 
 Input: head = 1->4->3->2->5->2, x = 3
 Output: 1->2->2->4->3->5
 
 没什么技巧, 遍历, 分别放在两个链表中, 然后连接起来.
 */
class Problem86Solution1 {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        guard let head = head else { return nil }
        
        var node: ListNode? = head
        
        let lessDummy = ListNode(0)
        var lessLast: ListNode? = lessDummy
        let greaterDummy = ListNode(0)
        var greaterLast: ListNode? = greaterDummy
        
        while node != nil {
            if node!.val < x {
                lessLast?.next = node
                lessLast = lessLast?.next
            }else{
                greaterLast?.next = node
                greaterLast = greaterLast?.next
            }
            node = node?.next
        }
        
        lessLast?.next = greaterDummy.next
        greaterLast?.next = nil
        
        return lessDummy.next
    }
}
