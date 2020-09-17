//
//  1TwoSum.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/9/27.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Cocoa
/// Given an array of integers, return indices of the two numbers such that they add up to a specific target.
/// You may assume that each input would have exactly one solution, and you may not use the same element twice.

/// 第一题,方法一,自己第一次解出来的, 虽然结果是正确的, 但是时间复杂度太高,两个循环遍历.  764ms
class Problem1Solution1 {
    /// 两个嵌套for循环,遍历相加,看是否等于tagrget
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return []
    }
}


/// 方法二, 参考更优的解决方案
class Problem1Solution2 {
    /// 使用一个hash表,hash表的查找过程大约是O(1)(考虑到哈希碰撞,所以这里是"大约") 16ms
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numsMap: [Int: Int] = [:]
        for i in 0..<nums.count {
            let otherNumber = target - nums[i]
            if let index = numsMap[otherNumber] {
                return [index, i]
            }
            numsMap[nums[i]] = i
        }
        return []
    }
}


