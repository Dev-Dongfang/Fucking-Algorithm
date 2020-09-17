//
//  20_ValidParentheses.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/10/9.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation


/*
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 An input string is valid if:
 
 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Note that an empty string is also considered valid.
 */


class Problem20Solution1 {
    //思路: 创建容量n的数组,遍历字符数组,遇到左括号入栈,右括号并且匹配则出栈,否则返回false
    func isValid(_ s: String) -> Bool {
        let chars = Array(s)
        var targetChars = Array<Character>(repeating: "-", count: s.count)
        var currentCount = 0
        let referenceElements: [Character: Character] = [")": "(", "]":"[", "}":"{"]
        for char in chars {
            if char == "(" || char == "[" || char == "{" {
                targetChars[currentCount] = char
                currentCount += 1
            }else if currentCount > 0 && targetChars[currentCount-1] == referenceElements[char] {
                currentCount -= 1
            }else{
                return false
            }
        }
        return currentCount == 0
    }
}
