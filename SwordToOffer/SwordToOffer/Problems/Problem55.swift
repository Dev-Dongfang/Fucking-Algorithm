//
//  Problem55.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/16.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 剑指 Offer 55 - I. 二叉树的深度
 输入一棵二叉树的根节点，求该树的深度。从根节点到叶节点依次经过的节点（含根、叶节点）形成树的一条路径，最长路径的长度为树的深度。

 例如：
 给定二叉树 [3,9,20,null,null,15,7]，
 */


/**
 方案1:递归法
 */
class Problem55_1_Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        
        let leftDepth = maxDepth(root?.left)
        let rightDepth = maxDepth(root?.right)
        return max(leftDepth, rightDepth) + 1
    }
}




/**
 剑指 Offer 55 - II. 平衡二叉树
 输入一棵二叉树的根节点，判断该树是不是平衡二叉树。如果某二叉树中任意节点的左右子树的深度相差不超过1，那么它就是一棵平衡二叉树。
 */

/**
 解决方案:
    判断一棵树是否是平衡二叉树. 即判断一个节点左右节点的深度相差小于等于1.
 */

class Problem55_2_Solution {
    
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        
        let leftDepth = maxDepth(root?.left)
        if leftDepth == -1 {
            return -1
        }
        let rightDepth = maxDepth(root?.right)
        if rightDepth == -1 {
            return -1
        }else if abs(leftDepth - rightDepth) > 1 {
            return -1
        }
        return max(leftDepth, rightDepth) + 1
    }
    
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return maxDepth(root) != -1
    }
}
