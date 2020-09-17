//
//  58_LengthOfLastWord.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/10/9.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation

/*
 Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.
 
 If the last word does not exist, return 0.
 
 Note: A word is defined as a character sequence consists of non-space characters only.
 
 Example:
 
 Input: "Hello World"
 Output: 5
 */

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var count = 0
        for char in s.reversed() {
            if char != " " {
                count += 1
            }else if count > 0 {
                break
            }
        }
        return count
    }
}
