//
//  Problem51.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/14.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 剑指 Offer 51. 数组中的逆序对
 在数组中的两个数字，如果前面一个数字大于后面的数字，则这两个数字组成一个逆序对。输入一个数组，求出这个数组中的逆序对的总数。

 示例 1:
 输入: [7,5,6,4]
 输出: 5
 */

/**
 解决方案1:冒泡排序
    排序一遍,数字交换的次数就是逆序对的个数
 */
class Problem51 {
    func reversePairs(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return 0 }
        
        var nums = nums
        var res = 0
        
        for i in 0..<nums.count {
            for j in 0..<(nums.count - 1 - i) {
                if nums[j] > nums[j + 1] {
                    nums.swapAt(j, j + 1)
                    res += 1
                }
            }
        }
        
        return res
    }
}
