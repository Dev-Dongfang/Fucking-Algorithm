//
//  136_SingleNumber.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/5/30.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation


/*
 1.使用字典存储每个数字, 如果数字在字典中存在则移出掉, 如果不存在则添加一个.
 */
class Problem136Solution1 {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        for num in nums {
            if let _ = dict[num] {
                dict.removeValue(forKey: num)
            }else{
                dict[num] = 1
            }
        }
        
        return dict.keys.first!
    }
}


/*
 2.使用数学
 2∗(a+b+c)−(a+a+b+b+c)=c
 */
class Problem136Solution2 {
    func singleNumber(_ nums: [Int]) -> Int {
        let numsSet = Set(nums)
        let sumSet = numsSet.reduce(0) { $0 + $1 }
        let total = nums.reduce(0) { $0 + $1 }
        return sumSet * 2 - total
    }
}


/*
 3.使用位运算
 异或运算, a^0=a, a^a=0
 */
class Problem136Solution3 {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
//        for i in 0..<nums.count {
//            result ^= nums[i]
//        }
        for num in nums {
            result ^= num
        }
        return result
    }
}
