//
//  Problem39.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/10.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 剑指 Offer 39. 数组中出现次数超过一半的数字
 数组中有一个数字出现的次数超过数组长度的一半，请找出这个数字。
 
 你可以假设数组是非空的，并且给定的数组总是存在多数元素。

 示例 1:
 输入: [1, 2, 3, 2, 2, 2, 5, 4, 2]
 输出: 2
 */

class Problem39Solution1 {
    //方案1：两次遍历，第一次统计字符出现次数，第二次遍历查找次数超过一半的那个数字
    func majorityElement(_ nums: [Int]) -> Int {
        
        var dict = [Int: Int]()
        for num in nums {
            dict[num] = (dict[num] ?? 0) + 1
        }
        for num in nums {
            if dict[num]! > (nums.count / 2) {
                return num
            }
        }
        return -1
    }
}



class Problem39Solution2 {
    //方案二：试想一下，加入一个数组中某个数字超过了这个数组长度的一半，那么让这个数组中超过一半的数字和其它数字两两结合，那么最后超过一半的数字一定有剩余。
    //一次遍历，最后剩下的数字就是超过一半的数字
    //解题思路：用一个栈，遍历数组，如果元素和栈顶元素相同则入栈，如果不同则出栈。（用数组也行）
    //相当于是计票算法。
    func majorityElement(_ nums: [Int]) -> Int {
        guard nums.isEmpty == false else { return -1 }
        
        var vote = 1, targetNum = nums[0]
        for index in 1..<nums.count {
            if targetNum == nums[index] {
                vote += 1
            }else{
                if vote == 0 {
                    vote = 1
                    targetNum = nums[index]
                }else{
                    vote -= 1
                }
            }
        }
        return targetNum
    }
}
