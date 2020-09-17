//
//  12IntegerToRoman.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/9/27.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation

//这道题官方也没给解决方案, 最笨的解决方案如下所示, 这道题我觉得没太大的意义.

/// 自己的解决方案
class Problem12Solution1 {
    // 使用递归来实现, 没三位数是一个递归,递归调用的方法内只解决三位数内的转换;
    //
    func intToRoman(_ num: Int) -> String {
        //每三位数是一个循环流程, 三位数内按照个十百千分解,每个位数使用不同符号表示并连接
        let romanMap = [0: "", 1: "I", 2: "II", 3: "III", 4: "IV",5: "V", 6: "VI", 7: "VII", 8: "VIII", 9: "IX",
                        10: "X", 20: "XX", 30: "XXX", 40: "XL", 50: "L", 60: "LX", 70: "LXX", 80: "LXXX", 90: "XC",
                        100: "C", 200: "CC", 300: "CCC", 400: "CD", 500: "D", 600: "DC", 700: "DCC", 800: "DCCC", 900: "CM",
                        1000: "M", 2000: "MM", 3000: "MMM"]
        var number = num

        let a = number % 10
        number -= a
        
        let b = number % 100
        number -= b
        
        let c = number % 1000
        number -= c
        
        let d = number % 10000
        number -= d
        
        return romanMap[d]! + romanMap[c]! + romanMap[b]! + romanMap[a]!
    }
}
