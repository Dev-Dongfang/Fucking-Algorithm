//
//  287_FindtheDuplicateNumber.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/5/30.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation


/*
 1.创建一个set, 依次将数字放入set中, 检查如果set中已经存在此数字, 则数字是重复的. 
 */
class Problem287Solution1 {
    func findDuplicate(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        for index in 0..<nums.count {
            if set.contains(nums[index]) {
                return nums[index]
            }
            set.update(with: nums[index])
        }
        return -1
    }
}


/*
 2.
 */
class Problem287Solution2 {
    func findDuplicate(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        for index in 0..<nums.count {
            if set.contains(nums[index]) {
                return nums[index]
            }
            set.update(with: nums[index])
        }
        return -1
    }
}
