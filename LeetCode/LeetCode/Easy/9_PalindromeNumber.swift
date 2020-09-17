//
//  9_PalindromeNumber.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/10/9.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation

//Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.  判断一个数字是否是回文数字


//时间复杂度O(x.length)
class Problem9Solution1 {
    func isPalindrome(_ x: Int) -> Bool {
        //如果是负数则一定不是回文
        guard x >= 0 else { return false }
        //翻转这个数字判断翻转后数字和原数字大小是否相等
        var number = x, targetNumber = 0
        while number > 0 {
            targetNumber = targetNumber * 10 + number % 10
            number /= 10
        }
        
        return targetNumber == x
    }
}
