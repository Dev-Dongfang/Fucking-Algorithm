//
//  Problem59.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/15.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 剑指 Offer 59 - I. 滑动窗口的最大值
 给定一个数组 nums 和滑动窗口的大小 k，请找出所有滑动窗口里的最大值。
 
 提示：
 你可以假设 k 总是有效的，在输入数组不为空的情况下，1 ≤ k ≤ 输入数组的大小。
 */


/**
 解决方案:
    首先计算前k个数字的大小, 然后向后移动的时候, 没移动一位都减去最前面的数字并加上最后面的数字,直到结束为止,统计其中的最大值.
 */
class Problem59Solution1 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        return nums
    }
}
