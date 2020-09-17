//
//  100_SameTree.swift
//  LeetCode
//
//  Created by 韦东方 on 2018/11/8.
//  Copyright © 2018 Wei Walden. All rights reserved.
//

import Foundation







/// 完美解决, 8ms最优解; 不过这算是leetcode的最简单的题目了吧
class Problem100Solution1 {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        return p?.val == q?.val && isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}
