//
//  268_MissingNumber.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/5/30.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation


/*
 1.数学方法. 遍历一遍, 找到最大的数字并累加. 使用最大的数字计算结果减去累加结果, 即为缺少的数字.
 2.二分查找法. 排序, 查找缺少的数字出现在哪个区间.
 3.异或运算.
 */

class Problem268Solution1 {
    func missingNumber(_ nums: [Int]) -> Int {
        var max = nums.count
        for index in 0..<nums.count {
            max ^= index ^ nums[index]
        }
        return max
    }
}
