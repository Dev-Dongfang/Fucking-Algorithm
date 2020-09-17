//
//  Problem18.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/10.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 剑指 Offer 18. 删除链表的节点
 给定单向链表的头指针和一个要删除的节点的值，定义一个函数删除该节点。

 返回删除后的链表的头节点。

 注意：此题对比原题有改动
 */


class Problem18Solution {
    //解决方案，遍历删除即可
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        let dummy = ListNode(-1)
        dummy.next = head
        var current: ListNode? = dummy
        while current?.next != nil {
            if current?.next?.val == val {
                let tmp = current?.next
                current?.next = tmp?.next
                break
            }
            current = current?.next
        }
        return dummy.next
    }
}
