//
//  66_PlusOne.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/9/30.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation

/*
 Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
 You may assume the integer does not contain any leading zero, except the number 0 itself.
 
 Example 1:
 Input: [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 
 Example 2:
 Input: [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 
 解决方案:
 1.数组转成字符串/转成数字/ +1 之后转成字符串数组.
 2.直接做加法运算,末尾进行 +1 操作, 其它各位进行进位操作.
 */



/// 以上是想到的两种解决方案,解题选用方案2
class Problem66Solution1 {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = [Int]()
        var num = 1
        for index in 0..<digits.count {
            let currentIndex = digits.count - 1 - index
            let currentNumber = (digits[currentIndex] + num) % 10
            num = (digits[currentIndex] + num) / 10
            result.insert(currentNumber, at: 0)
        }
        if num > 0 {
            result.insert(num, at: 0)
        }
        return result
    }
}









