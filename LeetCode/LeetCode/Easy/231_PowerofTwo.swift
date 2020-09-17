//
//  231_PowerofTwo.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/6/11.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation


/*
 Given an integer, write a function to determine if it is a power of two.
 
 Example 1:
 
 Input: 1
 Output: true
 Explanation: 20 = 1
 */

/*
 解法: 利用位与的一个特性, n & (n - 1)能够消除其二进制中最后一个1.
 */

class Problem231Solution1 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        return n > 0 && (n & (n - 1)) == 0
    }
}
