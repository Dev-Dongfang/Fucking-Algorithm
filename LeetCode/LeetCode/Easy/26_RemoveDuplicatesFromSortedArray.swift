//
//  26_RemoveDuplicatesFromSortedArray.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/9/29.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation


class Problem26Solution1 {
    //目标时间复杂度: O(n), 解决方案, 遍历的同时进行比较和插入操作
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        //空数组提前退出
        guard nums.count > 0 else { return 0 }
        var lenIndex = 0
        for currentIndex in 1..<nums.count {
            if nums[lenIndex] < nums[currentIndex] {
                lenIndex += 1
                nums[lenIndex] = nums[currentIndex]
            }
        }
        return lenIndex + 1
    }
}
