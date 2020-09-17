//
//  83_RemoveDuplicatesfromSortedList.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/9/29.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation


//Given a sorted linked list, delete all duplicates such that each element appear only once.

//解决方案1 32ms, O(1)两个指针,一前一后,比较是否相同,如果相同则继续下一个,如果不相同则移动后面的指针
class Problem83Solution1 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var first = head, last = head?.next
        while last != nil {
            if first?.val != last?.val {
                first?.next = last
                first = first?.next
            }
            last = last?.next
        }
        first?.next = nil
        return head
    }
}



//解决方案2 28ms,O(1),比起方案1少定义了一个变量, 循环中操作少了一条赋值语句, 但是方案1的代码,如果在连续相同的序列中只会赋值一次, 方案二在连续赋值中会赋值很多次.
class Problem83Solution2 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var nextNode = head
        while nextNode != nil {
            if nextNode?.val == nextNode?.next?.val {
                nextNode?.next = nextNode?.next?.next
            }
            nextNode = nextNode?.next
        }
        return head
    }
}
