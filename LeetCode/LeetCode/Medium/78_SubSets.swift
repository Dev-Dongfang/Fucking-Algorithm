//
//  78_SubSets.swift
//  LeetCode
//
//  Created by 韦东方 on 2018/12/3.
//  Copyright © 2018 Wei Walden. All rights reserved.
//

import Foundation


/*
 Given a set of distinct integers, nums, return all possible subsets (the power set).
 Note: The solution set must not contain duplicate subsets.
 */

/// 解法1: 尝试使用经典的回溯算法.
// 笔记:在算法选型上还是比较准确的,但是实现过程比较曲折, 原因在于自己对于回溯算法不太熟悉,加油,多做几道相关的题目,练习一下吧!
class Problem78Solution1 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 { return [] }
        
        var results = [[Int]]()
        var tmpList = [Int]()
        backtrace(results: &results, nums: nums, tmpList: &tmpList, index: 0)
        return Array(results)
    }
    
    private func backtrace(results: inout [[Int]], nums: [Int], tmpList: inout [Int], index: Int) {
        //输出结果
        results.append(tmpList)
        //遍历每种可能得情况
        for i in index..<nums.count {
            tmpList.append(nums[i])
            backtrace(results: &results, nums: nums, tmpList: &tmpList, index: i + 1)
            tmpList.removeLast()
        }
    }
}

