//
//  19_RemoveNthNodeFromEndofList.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/9/29.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation


/// 典型的使用快行指针解决的问题的例子.
/// 快行指针和慢行指针相差n个, 如果快行指针指向位置为尾部,则删除慢行指针指向的位置
class Problem19Solution1 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        //定义dummy结点,防止删除的是head
        let dummy = ListNode(0)
        dummy.next = head
        var quickNode: ListNode? = dummy
        var slowNode: ListNode? = dummy
        
        //设置快行指针的位置
        for _ in 0..<n {
            quickNode = quickNode?.next
        }
        
        //接着快行指针位置开始遍历结点
        while quickNode?.next != nil {
            quickNode = quickNode?.next
            slowNode = slowNode?.next
        }
        slowNode?.next = slowNode?.next?.next
        return dummy.next
    }
}


// 本地简单测试是通过的, 但是leetCode总是编译错误,目测是leetCode后端编译器bug.



