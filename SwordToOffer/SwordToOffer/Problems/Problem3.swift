//
//  Problem3.swift
//  SwordToOffer
//
//  Created by Walden on 2020/9/10.
//  Copyright © 2020 Walden. All rights reserved.
//

import Cocoa

/**
 剑指 Offer 03. 数组中重复的数字
 找出数组中重复的数字。

 在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。
 
 这里有四种解决方案，比较全面：https://leetcode-cn.com/problems/shu-zu-zhong-zhong-fu-de-shu-zi-lcof/solution/java-de-4chong-jie-fa-by-sdwwld/
 */


/**
 解决方案1：顺序遍历并用字典存储数字出现次数，当一个数字出现两次则返回这个数字。
 */
class Problem3Solution1 {
    //使用字典
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var dict = [Int: Bool]()
        for num in nums {
            if let _ = dict[num] {
                return num
            }else{
                dict[num] = true
            }
        }
        return -1
    }
    
    //使用集合
    func findRepeatNumber2(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        for num in nums {
            if set.contains(num) == true {
                return num
            }else{
                set.insert(num)
            }
        }
        return -1
    }
}



/**
 解决方案2：原地置换
    试想，如果没有重复的数字，那么正常排序后，数字i应该在下标为i的位置，所以思路是从头到尾扫描数组，遇到下标i的数字如果不是i的话，（假设是m）就拿与下标m的数字交换。交换过程中如果出现重复的数字则终止。
 */

class Problem3Solution2{
    func findRepeatNumber(_ nums: [Int]) -> Int {
        var sortNums = nums
        for (index, num) in sortNums.enumerated() {
            while num != index {
                if num == sortNums[num] {
                    return num
                }
                sortNums.swapAt(index, num)
            }
        }
        return -1
    }
}
