//
//  LongestPalindromicSubstring.swift
//  BasicAlgorithmSets
//
//  Created by 韦东方 on 2020/5/28.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

//最长回文字符串
//https://www.cnblogs.com/biyeymyhjob/archive/2012/10/04/2711527.html    https://leetcode.com/problems/longest-palindromic-substring/

class LongestPalindromicSubstring { }

//MARK: - 1.暴力破解
//leetcode超时
extension LongestPalindromicSubstring {
    func longestPalindrome(_ str: String) -> String {
        let arr = Array<Character>(str)
        guard arr.count > 1 else { return str }
        
        var palindromeString = String(arr[0])
        for left in 0..<arr.count {
            for right in (left + 1)..<arr.count {
                let currentLength = right - left
                if currentLength + 1 > palindromeString.count
                    && arr[left] == arr[right]
                    && isPalindromic(arr: arr, head: left, end: right) {
                    palindromeString = String(arr[left...right])
                }
            }
        }
        return palindromeString
    }
    
    //判断字符数组某个区间是否是
    private func isPalindromic(arr: [Character], head: Int, end: Int) -> Bool {
        var head = head, end = end
        while head < end {
            if arr[head] != arr[end] {
                return false
            }
            head += 1
            end -= 1
        }
        return true
    }
}


//MARK: - 2.找到最长子串
//反转字符串，找到最长相同子串并判断是不是回文，我们需要从最短的相同子串开始比较，依次比较较长的子串是否是回文。
extension LongestPalindromicSubstring {
    
}



//MARK: - 3.动态规划
extension LongestPalindromicSubstring {
    func longestPalindrome_dynamic(_ str: String) -> String {
        return str
    }
}


//MARK: - 4.从中间开始匹配
extension LongestPalindromicSubstring {
    func longestPalindrome_expendFromCenter(_ str: String) -> String {
        let arr = Array<Character>(str)
        guard arr.count > 1 else { return str }
        
        //总共需要查找2n-1个位置
        var left = 0, right = 0
        for i in 0..<arr.count - 1 {
            let len1 = expendFromCenter(arr: arr, left: i, right: i)
            let len2 = expendFromCenter(arr: arr, left: i, right: i + 1)
            let maxLen = max(len1, len2)
            if maxLen > right - left + 1 {
                left = i - (maxLen - 1) / 2
                right = i + maxLen / 2
            }
        }
        return String(arr[left...right])
    }
    
    private func expendFromCenter(arr: [Character], left: Int, right: Int) -> Int {
        var left = left, right = right
        while left >= 0 && right < arr.count && arr[left] == arr[right] {
            left -= 1
            right += 1
        }
        return right - left - 1
    }
}


//MARK: - 5.马拉车算法
extension LongestPalindromicSubstring {
    
}


