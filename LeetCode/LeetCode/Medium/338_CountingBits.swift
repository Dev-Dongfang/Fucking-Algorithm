//
//  338_CountingBits.swift
//  LeetCode
//
//  Created by 韦东方 on 2020/3/22.
//  Copyright © 2020 Wei Walden. All rights reserved.
//

import Foundation



/// 解法一, 循环遍历统计每个数字中有多少个二进制的1
class Problem338Solution1 {
    func countBits(_ num: Int) -> [Int] {
        guard num > 0 else { return [0] }
        var counts = Array<Int>.init(repeating: 0, count: num + 1)
        for index in 1...num {
            var count = 0
            var tmp =  index
            while tmp != 0 {
                tmp &= tmp - 1
                count += 1
            }
            counts[index] = count
        }
        return counts
    }
}


/// 这种方法就比较巧妙了, leetcode上学来的. 因为n & (n - 1)可以去掉二进制中最后一个1, 因此counts[n & (n - 1)] + 1 = counts[n].
/// 这种方法借助了历史计算结果计算出当前的结果, 是一种比较巧妙的方法!
class Problem338Solution2 {
    func countBits(_ num: Int) -> [Int] {
        guard num > 0 else { return [0] }
        var counts = Array<Int>.init(repeating: 0, count: num + 1)
        for index in 1...num {
            counts[index] = counts[index & (index - 1)] + 1
        }
        return counts
    }
}
