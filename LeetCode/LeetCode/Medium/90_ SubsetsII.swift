//
//  90_ SubsetsII.swift
//  LeetCode
//
//  Created by 韦东方 on 2018/12/5.
//  Copyright © 2018 Wei Walden. All rights reserved.
//

import Foundation

/*
 Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).
 Note: The solution set must not contain duplicate subsets.
 */


/// 类似78_subsets, 也是用回溯回溯算法解决问题的示例, 使用Set包含数组即可
// 需要注意的是, 两种解法在进行回溯之前必须都进行排序才行,否则不好使的.
/// 使用Set集合避免相同的元素,但是相同的元素还是会参加运算和比较, 没有从根本上解决问题.
class Problem90Solution1 {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result = Set<[Int]>()
        var tmp = [Int]()
        backTrace(nums: nums.sorted(), index: 0, results: &result, tmp: &tmp)
        return Array(result)
    }
    
    /// 回溯算法
    private func backTrace(nums: [Int], index: Int, results: inout Set<[Int]>, tmp: inout [Int]) {
        guard false == results.contains(tmp) else { return }
        results.insert(tmp)
        for i in index..<nums.count {
            tmp.append(nums[i])
            backTrace(nums: nums, index: i + 1, results: &results, tmp: &tmp)
            tmp.removeLast()
        }
    }
}


/// 更加高效的解法, 从程序上避免重复的运算,比起上面的solution1,会减少很多重复的运算, 因此ac时间也会更短一点
class Problem90Solution2 {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var tmp = [Int]()
        backTrace(nums: nums.sorted(), index: 0, results: &result, tmp: &tmp)
        return Array(result)
    }
    
    /// 回溯算法
    private func backTrace(nums: [Int], index: Int, results: inout [[Int]], tmp: inout [Int]) {
        results.append(tmp)
        for i in index..<nums.count {
            if i > index && nums[i] == nums[i-1] { continue }
            tmp.append(nums[i])
            backTrace(nums: nums, index: i + 1, results: &results, tmp: &tmp)
            tmp.removeLast()
        }
    }
}
