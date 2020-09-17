//
//  7_ReverseInteger.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/9/27.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation

/// 解决方案1
class Problem7Solution1 {
    // x可能是负数或者个位数
    func reverse(_ x: Int) -> Int {
        var number = Int32(x)
        var reverseNumber: Int32 = 0
        while number != 0 {
            let pop = number % 10
            number /= 10
            //判断是否会发生溢出
            if reverseNumber > Int32.max / 10 || reverseNumber == Int32.max / 10 && pop > 7 { return 0 }
            if reverseNumber < Int32.min / 10 || reverseNumber == Int32.min / 10 && pop < -8 { return 0 }
            reverseNumber = reverseNumber * 10 + pop
        }
        return Int(reverseNumber)
    }
}

