//
//  29_DivideTwoIntegers.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/10/9.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation

/*
 Given two integers dividend and divisor, divide two integers without using multiplication, division and mod operator.
 
 Return the quotient after dividing dividend by divisor.
 
 The integer division should truncate toward zero.
 */


// 使用减法实现除法运算
// 算法是没有错的,但是性能太低,当dividend很大,divisor=1时候,就需要循环甚至几千万次上亿次. 导致运算事件过长.
class Problem29Solution1 {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        guard dividend != 0 else {return 0}
        var d1 = abs(dividend)
        let d2 = abs(divisor)
        var count = 0
        while d1 >= d2 {
            d1 -= d2
            count += 1
        }
        if dividend > 0 && divisor > 0 || dividend < 0 && divisor < 0 {
            return count
        }else{
            return -count
        }
    }
}






/// 参考了讨论区的解法,看到有种利用移位运算实现的方案,相当于是使用左移来实现了乘法但是没有用到乘法的运算符号,还是符合题意的.
/// 简单示例如下所示. 算法贼块!
class Problem29Solution2 {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        //首先判断结果是正数还是负数
        let isPositive = dividend > 0 && divisor > 0 || dividend < 0 && divisor < 0
        var d1 = abs(dividend), d2 = abs(divisor)
        var result = 0
        while d1 >= d2 {
            var temp = d2
            var count = 1
            while temp <= d1 {
                temp <<= 1
                count <<= 1
            }
            d1 -= temp >> 1
            result += count >> 1
        }
        result = isPositive == true ? result : -result
        return result > Int32.max ? Int(Int32.max) : result
    }
}








