//
//  Problem50.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/10.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 剑指 Offer 50. 第一个只出现一次的字符
 在字符串 s 中找出第一个只出现一次的字符。如果没有，返回一个单空格。 s 只包含小写字母。

 示例:

 s = "abaccdeff"
 返回 "b"

 s = ""
 返回 " "
 */
class Problem50Solution1 {
    //解决方案1：两次遍历，第一次遍历将每个字符出现次数存储到字典中，第二次遍历从字典中取出字符，返回次数为1的那个字符
    func firstUniqChar(_ s: String) -> Character {
        guard s != "" else { return " " }
        let strArr = Array(s)
        var dict = [Character: Int](minimumCapacity: 100)
        for char in strArr {
            dict[char] = (dict[char] ?? 0) + 1
        }
        for char in strArr {
            if dict[char] == 1 {
                return char
            }
        }
        return " "
    }
}
