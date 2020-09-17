//
//  141_LinkedListCycle.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/5/28.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation


/*
 Java实现
 */
/**
 * Definition for singly-linked list.
 * class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
/*
public class Solution {
    public boolean hasCycle(ListNode head) {
        ListNode quickNode = head;
        ListNode slowNode = head;
        while (quickNode != null && slowNode != null && quickNode.next != null) {
            quickNode = quickNode.next.next;
            slowNode = slowNode.next;
            if (quickNode == null) {
                return false;
            }else if (quickNode == slowNode) {
                return true;
            }
        }
        return false;
    }
}
 */
