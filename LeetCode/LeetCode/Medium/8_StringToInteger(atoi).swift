//
//  8_StringToInteger(atoi).swift
//  LeetCode
//
//  Created by 韦东方 on 2018/11/10.
//  Copyright © 2018 Wei Walden. All rights reserved.
//

import Foundation

/*
 1.字符串必须以加号/减号/空格/数字开头才能够正式开始计算数字;
 2.数字后面可以接非数字,表示数字统计结束;
 3.非1中描述开头的则返回0;
 4.如果数字大小超过最大或者最小的32位整形,则返回最大或者最小的32位整形;
 */


/*
 这道题的话, 最终参考讨论区的答案写出来的. 前后尝试了一个多小时的时间. 回头想想看的话, 其实这是一个挺简单的问题. 给我的启示就是, 做题之前先思考, 先考虑好改怎么组织自己的代码, 怎么组织解题的逻辑步骤. 否则可能会漏掉很多东西.
 金诶u额问题固然非常重要, 但是有一个清晰的步骤也是非常重要的.
 */

class Problem8Solution1 {
    func myAtoi(_ str: String) -> Int {
        var index = 0, sign = 1, total = 0, strs = Array(str)
        
        //1.过滤空串
        guard strs.count > 0 else { return 0 }
        
        //2.过滤空格
        for char in strs {
            if char == " " {
                index += 1
            }else{
                break
            }
        }
        
        guard index <= strs.count - 1 else { return 0 }
        
        //3.判断符号位
        if strs[index] == "+" || strs[index] == "-" {
            sign = strs[index] == "+" ? 1 : -1
            index += 1
        }
        
        guard index <= strs.count  - 1 else { return 0 }
        
        //4.转换数字并避免溢出
        for i in index..<strs.count {
            //如果符号位后面出现任何非数字,则退出
            guard let number = Int("\(strs[i])") else { break }
            //判断是否溢出,如果不会造成溢出,则进行累加
            if Int32.max / 10 < total || Int32.max / 10 == total && Int32.max % 10 < number {
                return sign == 1 ? Int(Int32.max) : Int(Int32.min)
            }
            //累加数字
            total = total * 10 + number
        }
        
        return total * sign
    }
}




