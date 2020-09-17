//
//  46_ Permutations.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/10/9.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation

//Given a collection of distinct integers, return all possible permutations.



/// 看到这个题目,我的思路是,先从数组中取出第i个元素,然后将第i个元素分别插入到第i个位置去; 实践证明,这种方法是不行的.
class Problem46Solution1 {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        for i in 0..<nums.count {
            var subNums = nums
            subNums.remove(at: i)
            let element = nums[i]
            for j in i..<nums.count {
                var ns = subNums
                ns.insert(element, at: j)
                if result.contains(ns) {
                    continue
                }
                result.append(ns)
            }
        }
        return result
    }
}






/*
 回溯算法实际上一个类似枚举的搜索尝试过程，主要是在搜索尝试过程中寻找问题的解，当发现已不满足求解条件时，就“回溯”返回，尝试别的路径。
 回溯法是一种选优搜索法，按选优条件向前搜索，以达到目标。但当探索到某一步时，发现原先选择并不优或达不到目标，就退回一步重新选择，这种走不通就退回再走的技术为回溯法，而满足回溯条件的某个状态的点称为“回溯点”。
 回溯法（英语：backtracking）也称试探法，回溯法有“通用的解题方法”之称。它可以系统的搜索一个问题的所有解或者任意解。
 回溯法是一个既带有系统性又带有跳跃性的的搜索算法。它在包含问题的所有解的解空间树中，按照深度优先的策略，从根结点出发搜索解空间树。算法搜索至解空间树的任一结点时，总是先判断该结点是否肯定不包含问题的解。如果肯定不包含，则跳过对以该结点为根的子树的系统搜索，逐层向其祖先结点回溯。否则，进入该子树，继续按深度优先的策略进行搜索。回溯法在用来求问题的所有解时，要回溯到根，且根结点的所有子树都已被搜索遍才结束。而回溯法在用来求问题的任一解时，只要搜索到问题的一个解就可以结束。这种以深度优先的方式系统地搜索问题的解的算法称为回溯法，它适用于解一些组合数较大的问题.
 
 回溯法通常用最简单的递归方法来实现，在反复重复上述的步骤后可能出现两种情况：
 1 .找到一个可能存在的正确的答案。
 2. 在尝试了所有可能的分步方法后宣告该问题没有答案。
 在最坏的情况下，回溯法会导致一次复杂度为指数时间的计算。
 */

/// 讨论区看到的另一种解题方法, 这是一种回溯法的解决方案, 回溯法师一种深度优先的解决方法
class Problem46Solution2 {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var tempList = [Int]()
        backtrak(list: &result, tempList: &tempList, nums: nums)
        return result
    }
    
    private func backtrak(list: inout [[Int]], tempList: inout [Int], nums: [Int]) {
        guard tempList.count != nums.count else {
            list.append(tempList)
            return
        }
        for num in nums {
            if tempList.contains(num) {continue}
            tempList.append(num)
            backtrak(list: &list, tempList: &tempList, nums: nums)
            tempList.removeLast()   //回溯算法,所以必须移除上个添加的数据
        }
    }
}






/// 交换数据的回溯算法
class Problem46Solution3 {
    func permute(_ nums: [Int]) -> [[Int]] {
        var array = nums
        var result = [[Int]]()
        backtrak(list: &array, begin: 0, results: &result)
        return result
    }
    
    private func backtrak(list: inout [Int], begin: Int, results: inout [[Int]]) {
        if begin >= list.count {
            results.append(list)
        }else{
            for i in begin..<list.count {
                list.swapAt(begin, i)
                backtrak(list: &list, begin: begin + 1, results: &results)
                list.swapAt(i, begin)
            }
        }
    }
}




