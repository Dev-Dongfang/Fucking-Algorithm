//
//  Problem4.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/11.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation


/**
 剑指 Offer 04. 二维数组中的查找
 在一个 n * m 的二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。
 示例:

 现有矩阵 matrix 如下：

 [
   [1,   4,  7, 11, 15],
   [2,   5,  8, 12, 19],
   [3,   6,  9, 16, 22],
   [10, 13, 14, 17, 24],
   [18, 21, 23, 26, 30]
 ]
 给定 target = 5，返回 true。

 给定 target = 20，返回 false。
 */

/**
 解决方案1：暴力破解
    依次遍历，查找数字是否存在O(n^2)
 */
class Problem4Solution1 {
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        for nums in matrix {
            for num in nums {
                if target == num {
                    return true
                }
            }
        }
        return false
    }
}


/**
 解决方案2：线性查找
    从右上角开始查找，左上角的特点是：所有大于值的都在其下一行，所有小于其值的都在其左边。按照这个特点，当目标值小于当前值时候，x-1,当目标值大于当前值时候，y+1。
    同理，从左下角开始查找也是一样的。
 
在中文版的leetcode上，这种解法的时间复杂度竟然比暴力方法还高。看了下最优的解法，也是用的线性查找方法，不过前面添加了更详细的前置条件。
 ![](http://img.weidongfang.online/imgbed/20200911095430.png)
 */
class Problem4Solution2 {
    func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0, matrix[0].count > 0 else {
            return false
        }
        
        var x = matrix[0].count - 1
        var y = 0
        while y < matrix.count && x >= 0 {
            let current = matrix[y][x]
            if current > target {
                x -= 1
            }else if current < target {
                y += 1
            }else{
                return true
            }
        }
        
        return false
    }
}
