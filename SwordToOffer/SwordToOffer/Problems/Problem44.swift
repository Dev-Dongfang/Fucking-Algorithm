//
//  Problem44.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/13.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation



/**
 剑指 Offer 44. 数字序列中某一位的数字
 数字以0123456789101112131415…的格式序列化到一个字符序列中。在这个序列中，第5位（从下标0开始计数）是5，第13位是1，第19位是4，等等。

 请写一个函数，求任意第n位对应的数字。
 */


/**
 解决方案：暴力破解就不说了。另一种方案是找规律：1-9共9位数，10~99共180位，100~999共2700位，
 详见原题：https://leetcode-cn.com/problems/shu-zi-xu-lie-zhong-mou-yi-wei-de-shu-zi-lcof/solution/mian-shi-ti-44-shu-zi-xu-lie-zhong-mou-yi-wei-de-6/
 */


class Problem44 {
    func findNthDigit(_ n: Int) -> Int {
        //首先找到这个数位在哪个区间范围内。
        var n = n, digit = 1, start = 1, count = 9
        while n > count {
            start *= 10
            digit += 1
            n -= count
            count = digit * start * 9
        }
        //找到这个数位在哪个数字上
        let num = start + (n - 1) / digit
        let indexOfTargetLocation = (n - 1) % digit
        //找到这个数具体是哪个数字并返回
        return Int(Array("\(num)")[indexOfTargetLocation].asciiValue! - Character("0").asciiValue!)
    }
}

/**
 心得体会：这题目的关键在于找规律，好吧，我承认我没找到这规律，我只想到了统计位数，耽美找到如何统计。看了别人的解题思路有种顿悟的感觉。
 */
