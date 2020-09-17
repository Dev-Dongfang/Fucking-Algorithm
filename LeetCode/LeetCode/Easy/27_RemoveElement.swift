//
//  27_RemoveElement.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/9/29.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation

class Problem27Solution1 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var lenIndex = -1
        for index in 0..<nums.count {
            if val != nums[index] {
                lenIndex += 1
                if lenIndex != index {
                    nums[lenIndex] = nums[index]
                }
            }
        }
        return lenIndex + 1
    }
}
