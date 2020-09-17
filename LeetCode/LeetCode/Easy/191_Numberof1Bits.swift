//
//  191_Numberof1Bits.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/6/11.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation



/*
 解法: 利用位与的一个特性, n & (n - 1)能够消除其二进制中最后一个1.
 */


/* Java代码
public class Solution {
    // you need to treat n as an unsigned value
    public int hammingWeight(int n) {
    int count = 0;
    while (n != 0) {
    count++;
    n = n & (n - 1);
    }
    return count;
    }
}
 */
