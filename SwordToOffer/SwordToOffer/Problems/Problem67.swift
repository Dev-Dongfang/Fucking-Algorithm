//
//  Problem67.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/15.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 剑指 Offer 67. 把字符串转换成整数
 写一个函数 StrToInt，实现把字符串转换成整数这个功能。不能使用 atoi 或者其他类似的库函数。

 首先，该函数会根据需要丢弃无用的开头空格字符，直到寻找到第一个非空格的字符为止。
 当我们寻找到的第一个非空字符为正或者负号时，则将该符号与之后面尽可能多的连续数字组合起来，作为该整数的正负号；假如第一个非空字符是数字，则直接将其与之后连续的数字字符组合起来，形成整数。
 该字符串除了有效的整数部分之后也可能会存在多余的字符，这些字符可以被忽略，它们对于函数不应该造成影响。

 注意：假如该字符串中的第一个非空格字符不是一个有效整数字符、字符串为空或字符串仅包含空白字符时，则你的函数不需要进行转换。
 在任何情况下，若函数不能进行有效的转换时，请返回 0。

 说明：
 假设我们的环境只能存储 32 位大小的有符号整数，那么其数值范围为 [−231,  231 − 1]。如果数值超过这个范围，请返回  INT_MAX (231 − 1) 或 INT_MIN (−231) 。
 */

/**
 解决方案:
    这种题目是没有任何技巧的,就看能不能考虑到所有的边界条件了.
    列一下题目要求的条件:
    1.字符串开头空格会被忽略,一直到第一个非空字符开始计算;
    2.如果第一个字符是正负号,则用其表示符号,如果是数字,则表示数字;
    3.数字后面可能会有无效的字符,这些字符应该被忽略;
    4.如果第一个非空字符不是正负号,不是数字,则返回0;
    5.限制最大存储32位有符号整形数字,如果数字超过这个范围则返回最大值或者最小值;
 */
class Problem67 {
    func strToInt(_ str: String) -> Int {
        let strArr = Array(str)
        //1.空串返回0
        if strArr.count == 0 {
            return 0
        }
        //检验规则1-忽略前缀空格
        var index = 0
        while index < strArr.count && strArr[index].asciiValue == Character(" ").asciiValue {
            index += 1
        }
        if index >= strArr.count {
            return 0
        }
        //规则2-检验非空字符是否是数字或者正负号
        let numsSet = Set<Character>(Array("0123456789+-"))
        let firstChar = strArr[index]
        if numsSet.contains(strArr[index]) == false {
            return 0
        }
        //标记符号位
        let flag = firstChar == "-" ? -1 : 1
        if firstChar == "+" || firstChar == "-" {
            index += 1
        }
        if index >= strArr.count {
            return 0
        }
        let asciiValue0 = Int(Character("0").asciiValue!)
        let contract = Int(strArr[index].asciiValue!) - asciiValue0
        if index >= strArr.count
            || contract > 9
            || contract < 0 {
            return 0
        }
        
        //遍历统计数字
        var res = 0
        
        while index < strArr.count {
            let val = Int(strArr[index].asciiValue!) - asciiValue0
            if val < 10 && val >= 0 {
                res = res * 10 + Int(val)
            }else{
                break
            }
            if res * flag > Int32.max {
                return Int(Int32.max)
            }else if res * flag < Int32.min {
                return Int(Int32.min)
            }
            index += 1
        }
        
        return res * flag
    }
}
