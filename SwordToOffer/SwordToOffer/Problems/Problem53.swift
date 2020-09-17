//
//  Problem53.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/17.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation


/**
 剑指 Offer 53 - I. 在排序数组中查找数字 I
    统计一个数字在排序数组中出现的次数。
 */


/**
 解决方案: 这其实就是一个二分查找的变体, 找到第一个是target的数字,然后找到最后一个target的数字, index差值就是数量
 */



class Problem53_1_Solution {
    
    func search(_ nums: [Int], _ target: Int) -> Int {

    }
    
}






/**
 剑指 Offer 53 - II. 0～n-1中缺失的数字
 一个长度为n-1的递增排序数组中的所有数字都是唯一的，并且每个数字都在范围0～n-1之内。在范围0～n-1内的n个数字中有且只有一个数字不在该数组中，请找出这个数字。
 */

/**
 解决方案:
    二分查找,查找到第一个index != arr[index]的数字.
 */




/// 方案1: 顺序遍历查找
class Problem53_2_Solution1 {
    func missingNumber(_ nums: [Int]) -> Int {
        guard nums.count >= 1 else { return -1 }
        for (index, num) in nums.enumerated() {
            if index != num {
                return index
            }
        }
        return nums.count
    }
}

/// 方案2: 利用异或操作, 一个数字异或两次等于0, 我们从头到尾将数组中数字异或一遍, 那么最后的结果就是异或一次的数字.
class Problem53_2_Solution2 {
    func missingNumber(_ nums: [Int]) -> Int {
        guard nums.count >= 1 else { return -1 }
        var res = nums.count
        for i in 0..<nums.count {
            res ^= i ^ nums[i]
        }
        return res
    }
    
    // 优化:由于当res!=0时候的i就是要查找的数字,因此没必要继续遍历了,直接返回就行了
    // AC 执行用时：156 ms, 在所有 Swift 提交中击败了100.00%的用户.
    func missingNumber1(_ nums: [Int]) -> Int {
        guard nums.count >= 1 else { return -1 }
        var res = 0
        for i in 0..<nums.count {
            res ^= i ^ nums[i]
            if res != 0 {
                return i
            }
        }
        return nums.count
    }
}



/// 方案3: 二分查找
class Problem53_2_Solution3 {
    func missingNumber(_ nums: [Int]) -> Int {
        guard nums.count >= 1 else { return -1 }
        var left = 0, right = nums.count - 1
        while left <= right {
            let mid = (left + right) >> 1
            if nums[mid] ^ mid == 0 {
                left = mid + 1
            }else{
                right = mid - 1
            }
        }
        return left
    }
}



