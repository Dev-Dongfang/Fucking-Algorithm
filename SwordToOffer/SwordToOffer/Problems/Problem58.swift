//
//  Problem58.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/15.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 剑指 Offer 58 - I. 翻转单词顺序
 输入一个英文句子，翻转句子中单词的顺序，但单词内字符的顺序不变。为简单起见，标点符号和普通字母一样处理。例如输入字符串"I am a student. "，则输出"student. a am I"。
 
 说明：
 无空格字符构成一个单词。
 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
 */

/**
 解决方案: 两次反转,第一次反转整个字符串, 第二次反转单词.
 */

class Problem58Solution1 {
    func reverseWords(_ s: String) -> String {
        //1-去空格
        var strArr = Array(s)
        var slow = 0    //, fast = 0
        for (_, char) in strArr.enumerated() {
            if char != " " {
                strArr[slow] = char
                slow += 1
            }else if slow > 0 && strArr[slow - 1] != " " {
                strArr[slow] = char
                slow += 1
            }
        }
        var realArr = Array(strArr[0..<slow])
        if realArr.last == " " {
            realArr.removeLast()
        }
        
        //2-反转整个字符串
        reverse(arr: &realArr, left: 0, right: realArr.count - 1)
        
        //3-反转单个单词
        var left = 0, right = 0
        for char in realArr {
            if char == " " {
                reverse(arr: &realArr, left: left, right: right - 1)
                left = right + 1
            }
            right += 1
        }
        reverse(arr: &realArr, left: left, right: right - 1)
        
        return String(realArr)
    }
    
    //反转字符数组指定范围
    private func reverse(arr: inout [Character], left: Int, right: Int) {
        var left = left, right = right
        while left < right {
            arr.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}

/**
 解决方案2: 拼接字符串. 遍历碰到非空字符则用变量承接，碰到空格则将单词拼接到目标字符串的前面。 一次遍历即可
 */
class Problem58Solution {
    func reverseWords(_ s: String) -> String {
        var res = ""
        var word = ""
        for char in s {
            if char == " " {
                //非空字符全部拼接到word上
                //空格
                if word.count > 0 {
                    res = word + " " + res
                    word = ""
                }
            }else{
                //如果是空字符，则判断word长度，如果word非空则拼接到结果字符串中
                //非空格
                word = word + "\(char)"
            }
        }
        if word.count > 0 {
            res = word + " " + res
        }
        if res.last == " " {
            res.removeLast()
        }
        
        return res
    }
}








/**
 剑指 Offer 58 - II. 左旋转字符串
 字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。
 */
/**
 解决方案：
 类似于第一题的解法，两次反转。第一次全部反转，第二次，前面和后面分别反转
 方法2：字符串拼接
 */

class Problem58_2_Solution1 {
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        var sArr = Array(s)
        reverse(arr: &sArr, left: 0, right: sArr.count - 1)
        let centerIndex = sArr.count - n
        reverse(arr: &sArr, left: 0, right: centerIndex - 1)
        reverse(arr: &sArr, left: centerIndex, right: sArr.count - 1)
        return String(sArr)
    }
    
    private func reverse(arr: inout [Character], left: Int, right: Int) {
        var left = left, right = right
        while left < right {
            arr.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}
