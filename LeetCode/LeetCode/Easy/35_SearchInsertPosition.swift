//
//  35_SearchInsertPosition.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/9/28.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation

/*
 Given a sorted array and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 
 You may assume no duplicates in the array.
 
 本题首先自己根据自己的理解写出二分查找, 结果是正确的, 速度也是最好的, 但是冗余代码还是比较多的, 可能是个人对二分查找没有那么深刻的理解, 毕竟平时基本用不到的. 参考最优解对自己代码进行改造的代码如解2所示.
 二分查找中,对边界的限制上, 右边界限制为查找区间最后一个元素index+1比较好, 这样在比较时候我们可以只比较左边界是否满足条件以便中断递归.
 */


/// 第一遍自己做出来的结果
class Problem35Solution1 {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        if nums[0] > target {
            return 0
        } else if nums[nums.count - 1] < target {
            return nums.count
        }
        return binarySearch(nums: nums, leftIndex: 0, rightIndex: nums.count - 1, target: target)
    }
    
    /// 递归二分查找法
    func binarySearch(nums: [Int], leftIndex: Int, rightIndex: Int, target: Int) -> Int {
        //当找到相等的数字时候退出查找
        if nums[leftIndex] == target { return leftIndex }
        if nums[rightIndex] == target { return rightIndex }
        
        //当找不到时候返回要插入的数字应该在的位置Index
        if leftIndex == rightIndex || rightIndex - leftIndex == 1 { return leftIndex + 1 }
        
        //计算下一个二分查找的区间
        let middleIndex = (leftIndex + rightIndex) / 2
        if nums[middleIndex] > target {
            return binarySearch(nums: nums, leftIndex: leftIndex, rightIndex: middleIndex, target: target)
        }else{
            return binarySearch(nums: nums, leftIndex: middleIndex, rightIndex: rightIndex, target: target)
        }
    }
}



/// 第二遍根据leetCode上面最优解改造出来的代码, 比起第一种解法更加的简洁,代码量更小一点
class Problem35Solution2 {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        return binarySearch(nums: nums, leftIndex: 0, rightIndex: nums.count, target: target)
    }
    
    /// 递归二分查找法
    func binarySearch(nums: [Int], leftIndex: Int, rightIndex: Int, target: Int) -> Int {
        //当左右相等时候退出查找,返回左边index
        if leftIndex >= rightIndex { return leftIndex }
        //计算下一个二分查找的区间
        let middleIndex = (leftIndex + rightIndex) / 2
        if nums[middleIndex] > target {
            return binarySearch(nums: nums, leftIndex: leftIndex, rightIndex: middleIndex, target: target)
        }else if nums[middleIndex] < target{
            return binarySearch(nums: nums, leftIndex: middleIndex + 1, rightIndex: rightIndex, target: target)
        }else{
            return middleIndex
        }
    }
}




/// 第三种方法: leetCode上给出的解法, 算是比较简洁的标准的二分查找法
class Problem35Solution3 {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        return binarySearch(nums, 0..<nums.count, target)
    }
    
    func binarySearch(_ arr: [Int], _ range: Range<Int>, _ target: Int) -> Int {
        if range.lowerBound >= range.upperBound { return range.lowerBound }
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        if arr[midIndex] > target {
            return binarySearch(arr, range.lowerBound..<midIndex, target)
        } else if arr[midIndex] < target {
            return binarySearch(arr, midIndex+1..<range.upperBound, target)
        } else {
            return midIndex
        }
    }
}



