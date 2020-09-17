//
//  Problem16.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/14.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 剑指 Offer 16. 数值的整数次方
 实现函数double Power(double base, int exponent)，求base的exponent次方。不得使用库函数，同时不需要考虑大数问题。
 */

/**
 解决方案：
 方案一：暴力破解法，遍历n次，每次将结果乘以x；
 方案二：既然是个算法题目，这里肯定不能满足于用暴力方法解题。
    观察发现，我们可以将x^n进行分解，然后结合幂运算的规律更快的计算结果。
 */
class Problem16 {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if x == 0 {
            return 0
        }
        
        var n = n
        var x = x
        var res: Double = 1
        if n < 0 {
            n = -n
            x = 1 / x
        }
        while n > 0 {
            if n & 1 == 1 {
                res *= x
            }
            x *= x
            n = n >> 1
        }
        return res
    }
    
    
    
    func myPow2(_ x: Double, _ n: Int) -> Double {
        if x == 0 {
            return 0
        }
        
        if n == 0 {
            return 1
        }
        
        var x = x, n = n
        if n < 0 {
            n = -n
            x = 1 / x
        }
        var res: Double = x
        
        if n & 1 == 1 {
            res = myPow2(res * res, n >> 1) * res
        }else{
            res = myPow2(res * res, n >> 1)
        }
        
        
        return res
        
        
    }
}
