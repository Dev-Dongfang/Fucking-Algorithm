//
//  5_LongestPalindromicSubstring.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/9/29.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation


//-----------------------------------------注意!!!-----------------------------------------
//swift中使用String.Index处理字符串问题时候非常非常低效!!!! 如果需要大量使用下标定位字符串中字符位置时候, 需要先把字符串转成字符数组,然后使用Int下标方式访问特定字符!!!



/// 方法1: 自己能想到的第一种解决方案暴力一点的, O(n^3), 两个for循环, 分别检查每两个字母之间是否是回文
/// 测试结果: 当字符串很长时候,太耗时, 导致超出时间
class Problem5Solution1 {
    func longestPalindrome(_ s: String) -> String {
        var palindromeString = ""
        let startIndex = s.startIndex
        for left in 0..<s.count {
            for right in left..<s.count {
                let leftIndex = s.index(startIndex, offsetBy: left)
                let rightIndex = s.index(startIndex, offsetBy: right)
                let text = String(s[leftIndex...rightIndex])
                if isPalindromic(string: text) && text.count >= palindromeString.count {
                    palindromeString = text
                }
            }
        }
        return palindromeString
    }
    
    /// 检查给定的字符串是否是会问字符串
    private func isPalindromic(string: String) -> Bool {
        let startIndex = string.startIndex
        var left = 0
        var right = string.count - 1
        while left < right {
            let leftIndex = string.index(startIndex, offsetBy: left)
            let rightIndex = string.index(startIndex, offsetBy: right)
            if string[leftIndex] != string[rightIndex] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
}





/// 方法二: 参考解决方案1, 先翻转字符串, 然后从翻转前后字符串找出最长的相同的子串,验证子串是否是一个合法的回文字符串
// 接下来是怎么从两个字符串中查找最长子串的问题. 查到到后再判断是否是回文.
// 关于查找最长公共子序列,我们可以使用动态规划来做, 将翻转前后字符串,相同位置字符相同的标记在二维数组中,二维数组中对角线都是被标记的时候,则最长的对角线就是回文字符串的位置
/// O(n^2的解决方案一样是时间超长)
class Problem5Solution2 {
    func longestPalindrome(_ s: String) -> String {
        let originString = Array(s)
        let reverseString = Array(originString.reversed())
        var arr = Array(repeating: Array(repeating: 0, count: s.count), count: s.count)
        var palindromeString: [Character] = []
        
        for i in 0..<s.count {
            for j in 0..<s.count {
                if originString[i] == reverseString[j] {
                    if i * j > 0 {  //i>0 && j>0
                        arr[i][j] = arr[i-1][j-1] + 1
                    }else{
                        arr[i][j] = 1
                    }
                    //如果arr[i][j] > palindromeString.count,并且是一个回文, 重新给它赋值
                    let targetDurations = Array(originString[i+1-arr[i][j]...i])
                    if arr[i][j] > palindromeString.count && targetDurations == targetDurations.reversed() {
                        palindromeString = targetDurations
                    }
                }
            }
        }
        return String(palindromeString)
    }
}





/// 解法3:从中间开始向两边排除
class Problem5Solution3 {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 0 else {return ""}
        
        var start = 0, end = 0, arr = Array(s)
        for i in 0..<arr.count {
            let len1 = expandAroundCenter(arr: arr, left: i, right: i)
            let len2 = expandAroundCenter(arr: arr, left: i, right: i + 1)
            let len = max(len1, len2)
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        
        let startIndex = s.index(s.startIndex, offsetBy: start)
        let endIndex = s.index(s.startIndex, offsetBy: end)
        return String(s[startIndex...endIndex])
    }
    
    private func expandAroundCenter(arr: [Character], left: Int, right: Int) -> Int {
        var L = left, R = right
        while L >= 0 && R < arr.count && arr[L] == arr[R] {
            L -= 1
            R += 1
        }
        return R - L - 1
    }
}



