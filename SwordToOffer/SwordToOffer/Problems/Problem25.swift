//
//  Problem25.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/10.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 剑指 Offer 25. 合并两个排序的链表
 输入两个递增排序的链表，合并这两个链表并使新链表中的节点仍然是递增排序的。

 示例1：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 限制：

 0 <= 链表长度 <= 1000

 注意：本题与主站 21 题相同：https://leetcode-cn.com/problems/merge-two-sorted-lists/
 */

class Problem25Solution {
    /// 解决方案：没什么技巧而言，遍历两个链表插入到新的链表中即可。
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        //都是非空节点，循环遍历
        let dummy = ListNode(-1)
        var lastNode = dummy
        var l1 = l1, l2 = l2
        while l1 != nil && l2 != nil {
            if l1!.val < l2!.val {
                lastNode.next = l1
                l1 = l1?.next
            }else{
                lastNode.next = l2
                l2 = l2?.next
            }
            lastNode = lastNode.next!
        }
        lastNode.next = l1 ?? l2
        return dummy.next
    }
}
