//
//  11_ContainerWith_Most_Water.swift
//  LeetCode
//
//  Created by 韦东方 on 2018/11/12.
//  Copyright © 2018 Wei Walden. All rights reserved.
//

import Foundation

/*
 最多能够储水量, 实际上是能够保证不溢出时候最大的面积.能够计算出最大面积,即能够计算出最大的储水量.
 
 方法一:依次计算当高度为x&&水不会溢出时候最大的储水量,计算过程中存储最大的储水量, 计算结束返回结果即可;
        此方法中关键问题是查找第一个高度超过x的列,和最后一个高度超过x的列,计算过程中计算比较出最大的储水量;
 方法二:从第二列开始,依次计算从第x列向前推,能够存储最大的储水量.
        此方法的关键问题是,每次从前面查找到最大的一个合适的列,查找到最大的储水量;
 方法三:时间复杂度O(n),空间复杂度O(1)的解,参考推荐Solution的解决方案;
        首先可以思考,最大储水量其实就是能够表示的最大的面积-->最大表示的面积由两个因素决定:1.两个元素之间的距离,2.两个元素中最小的高度
        解决方案是,我们从两端开始计算,取其中较小的那一端,找到比它更大的一个数字,因为所有比它小的数字计算出来面积一定比它更小(宽度再缩小,高度也在缩小),只有找到比它高度更高的数字才可能找到更大的面积.如此循环往复即可;
 */


class Problem11Solution1 {
    func maxArea(_ height: [Int]) -> Int {
        var leftIndex = 0
        var rightIndex = height.count - 1
        var maxarea = 0
        while leftIndex < rightIndex {
            maxarea = max(maxarea, min(height[leftIndex], height[rightIndex]) * (rightIndex - leftIndex))
            if height[leftIndex] < height[rightIndex] {
                leftIndex += 1
            }else{
                rightIndex -= 1
            }
        }
        return maxarea
    }
}

