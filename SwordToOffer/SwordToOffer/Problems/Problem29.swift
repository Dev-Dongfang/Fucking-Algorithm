//
//  Problem29.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/13.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation


/**
 剑指 Offer 29. 顺时针打印矩阵
 输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字。

 示例 1：
 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[1,2,3,6,9,8,7,4,5]
 
 示例 2：
 输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 输出：[1,2,3,4,8,12,11,10,9,5,6,7]
  
 限制：
 0 <= matrix.length <= 100
 0 <= matrix[i].length <= 100
 */


/**
 解决方案1：
    模拟。创建一个和matrix一样大小的数组，用于存放是否被访问过
 
 解决方案2：
    按层遍历，创建一个遍历的边界，然后循环遍历，当第一层遍历完毕，遍历第二层。
    这里的重点是边界条件，很容易把人绕晕。。。
 */
class Problem29 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard matrix.count > 0 else { return [] }
        
        if matrix.count == 1 { return matrix[0] }
        if matrix[0].count == 1 { return matrix.flatMap { $0 } }
        
        var res = [Int]()
        
        var left = 0, right = matrix[0].count - 1
        var top = 0, bottom = matrix.count - 1
        
        while left < right && top < bottom {
            var index = left
            while index < right {
                res.append(matrix[top][index])
                index += 1
            }
            index = top
            while index < bottom {
                res.append(matrix[index][right])
                index += 1
            }
            index = right
            while index > left {
                res.append(matrix[bottom][index])
                index -= 1
            }
            index = bottom
            while index > top {
                res.append(matrix[index][left])
                index -= 1
            }
            
            top += 1
            left += 1
            right -= 1
            bottom -= 1
        }
        if top == bottom && left <= right {
            for x in left...right {
                res.append(matrix[top][x])
            }
        }else if left == right && top <= bottom {
            for y in top...bottom {
                res.append(matrix[y][left])
            }
        }
        
        return res
    }
}
