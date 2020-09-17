//
//  137_SingleNumberII.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/5/30.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation


/*
 1.数学方法
 1> 数据存放在set中, 累加set中数据;
 2> 累加nums
 3> (set累加结果*3-nums累加结果) / 2
 */
class Problem137Solution1 {
    func singleNumber(_ nums: [Int]) -> Int {
        let set = Set(nums)
        let sumSet = set.reduce(0) { $0 + $1 }
        let sumNums = nums.reduce(0) { $0 + $1 }
        return (sumSet * 3 - sumNums) >> 1
    }
}
