//
//  21_MergeTwoSortedLists.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/10/9.
//  Copyright © 2018年 Wei Walden. All rights reserved.
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
class Problem21Solution1 {
    ///循环比较两个listNode中较小的放在目标list中. 如果其中一个为空,则将另一个追加在尾部
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var dummy = ListNode(0), currentNode: ListNode? = dummy, list1 = l1, list2 = l2
        while list1 != nil && list2 != nil {
            if list1!.val < list2!.val {
                currentNode?.next = list1
                list1 = list1?.next
            }else{
                currentNode?.next = list2
                list2 = list2?.next
            }
            currentNode = currentNode?.next
        }
        //WARNING: 如果能用else if就不要拆开用两个if, 用两个if会用一定走两个判断语句,用一个可能走一个判断.
        if list1 != nil {
            currentNode?.next = list1
        }else if list2 != nil {
            currentNode?.next = list2
        }
        return dummy.next
    }
}
