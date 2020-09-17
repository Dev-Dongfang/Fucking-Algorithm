//
//  Problem46.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/11.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation



/**
 剑指 Offer 46. 把数字翻译成字符串
 给定一个数字，我们按照如下规则把它翻译为字符串：0 翻译成 “a” ，1 翻译成 “b”，……，11 翻译成 “l”，……，25 翻译成 “z”。一个数字可能有多个翻译。请编程实现一个函数，用来计算一个数字有多少种不同的翻译方法。
 */


/**
 解决方案：
 */

class Problem46Solution {
    func translateNum(_ num: Int) -> Int {
        let strArr = Array("\(num)")
        
        return translate(chars: strArr, index: 0)
    }
    
    private func translate(chars: [Character], index: Int) -> Int {
        //退出条件
        if index > chars.count - 1 {
           return 0
        }else if index == chars.count - 1 {
           return 1
        }
        
        let combineNumber = Int("\(chars[index])")! * 10 + Int("\(chars[index + 1])")!
        let combineAble =  combineNumber <= 25 && combineNumber >= 10
        
        //退出条件
        if index == chars.count - 2 {
            return combineAble ? 2 : 1
        }
        
        //判断 index 和 index + 1能否被翻译，假设翻译数量为count
        //若不能，则count = index + 2的翻译数量
        //若能，则count = (index + 1翻译数量) + (index + 2翻译数量)
        if combineAble {
            return translate(chars: chars, index: index + 1) + translate(chars: chars, index: index + 2)
        }else{
            return translate(chars: chars, index: index + 1)
        }
    }
}




/**
 解决方案2：
    从后向前开始依次扫描，
 
 */
class Problem46Solution1 {
    func translateNum(_ num: Int) -> Int {
        if num < 10 {
            return 1
        }
        
        let temp = num % 100
        if temp >= 10 && temp <= 25 {
            return translateNum(num / 10) + translateNum(num / 100)
        }else{
            return translateNum(num / 10)
        }
    }
}

