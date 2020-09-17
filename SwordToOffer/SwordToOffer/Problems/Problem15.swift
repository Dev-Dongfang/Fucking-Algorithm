//
//  Problem15.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/9.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation


/**
 问题：请实现一个函数，输入一个整数，输出该数二进制表示中 1 的个数。例如，把 9 表示成二进制是 1001，有 2 位是 1。因此，如果输入 9，则该函数输出 2。
 */

/**
 解决方案1：通过按位与，统计是1的个数。
 */
//AC: 8ms
class Problem15Solution1 {
    func hammingWeight(_ n: Int) -> Int {
        var count = 0
        var n = n
        while n > 0 {
            if n & 1 == 1 {
                count += 1
            }
            n = n >> 1
        }
        return count
    }
}


/**
 解决方案2：按位与，从1开始向左移动
 */
class Problem15Solution2 {
    func hammingWeight(_ n: Int) -> Int {
        var count = 0
        var tmp = 1
        for _ in 0..<64 {
            if (n & tmp) > 0 {
                count += 1
            }
            tmp = tmp << 1
        }
        return count
    }
}



/**
 解决方案3：巧用n&(n-1)
 */
class Problem15Solution3 {
    func hammingWeight(_ n: Int) -> Int {
        var count = 0
        var n = n
        while n > 0 {
            n = n & (n - 1)
            count += 1
        }
        return count
    }
}
