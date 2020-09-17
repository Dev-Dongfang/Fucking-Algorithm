//
//  Problem17.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/11.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 输入数字 n，按顺序打印出从 1 到最大的 n 位十进制数。比如输入 3，则打印出 1、2、3 一直到最大的 3 位数 999。

 示例 1:
 输入: n = 1
 输出: [1,2,3,4,5,6,7,8,9]
  
 说明：
 用返回一个整数列表来代替打印
 n 为正整数
 */


/**
 解决方案，遍历打印呗！
 */
class Problem17Solution {
    func printNumbers(_ n: Int) -> [Int] {
        var nums = [Int]()
        for i in 1..<Int(pow(10.0, Double(n))) {
            nums.append(i)
        }
        return nums
    }
}

