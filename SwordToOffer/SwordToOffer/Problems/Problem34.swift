//
//  Problem34.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/10.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation


/**
 剑指 Offer 34. 二叉树中和为某一值的路径
 输入一棵二叉树和一个整数，打印出二叉树中节点值的和为输入整数的所有路径。从树的根节点开始往下一直到叶节点所经过的节点形成一条路径。
 */
/**
 解决方案：比比多说，典型的回溯法应用
 */
class Problem34Solution1 {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        guard let root = root else { return [] }
        
        var res = [[Int]]()
        var path = [Int]()
        func backtrace(node: TreeNode) {
            path.append(node.val)
            if node.left == nil && node.right == nil {
                if path.reduce(0, { $0 + $1 }) == sum {
                    res.append(path)
                }
                path.removeLast()
                return
            }
            
            if let left = node.left {
                backtrace(node: left)
            }
            if let right = node.right {
                backtrace(node: right)
            }
            path.removeLast()
        }
        backtrace(node: root)
        
        return res
    }
    
    
}
