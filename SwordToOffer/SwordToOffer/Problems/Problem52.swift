//
//  Problem52.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/10.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 剑指 Offer 52. 两个链表的第一个公共节点
 输入两个链表，找出它们的第一个公共节点。
 */


/**
 解决方案1：常规的解题思路，第一次遍历记录两个链表路径长度分别是多少，比如两个长度相差n，然后让长的先走n步，然后两个同时开始走，当两个相遇时候，他们的值相等
 */
class Problem52Solution1 {
    //省略号.......
}



/**
 解决方案2：虐狗大法
 你变成我，走过我走过的路。
 我变成你，走过你走过的路。
 然后我们便相遇了..
 操作：a,b两个同时开始走，当a走到头时候指向b，b走到头后指向a，然后如果两个值相等则是第一个公共节点。这个算法类似于快慢指针，当相遇时候，两个指针走过的路径是相同的。
 解析：https://leetcode-cn.com/problems/liang-ge-lian-biao-de-di-yi-ge-gong-gong-jie-dian-lcof/solution/shuang-zhi-zhen-fa-lang-man-xiang-yu-by-ml-zimingm/
 */
class Problem52Solution2 {
    public func getIntersectionNode(headA: ListNode?, headB: ListNode?) -> ListNode? {
        guard headA != nil && headB != nil else { return nil }
        
        var h1 = headA, h2 = headB
        while h1?.val != h2?.val {
            h1 = h1 == nil ? headB : h1?.next
            h2 = h2 == nil ? headA : h2?.next
        }
        return h1
    }
    
    /** JAVA代码
     public ListNode getIntersectionNode(ListNode headA, ListNode headB) {
         if (headA == null || headB == null) {
             return null;
         }
         
         ListNode h1 = headA;
         ListNode h2 = headB;
         while (h1 != h2) {
             h1 = h1 == null ? headB : h1.next;
             h2 = h2 == null ? headA : h2.next;
         }
         return h1;
     }
     */
}
