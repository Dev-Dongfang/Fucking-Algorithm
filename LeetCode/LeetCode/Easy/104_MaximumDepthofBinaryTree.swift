//
//  104_MaximumDepthofBinaryTree.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/6/10.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation


/*
 Given a binary tree, find its maximum depth.
 
 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Given binary tree [3,9,20,null,null,15,7],
 
 3
 / \
 9  20
 /  \
 15   7
 return its depth = 3.
 
 
 递归解决方案:
 分解问题: 第一层深度等一第二层的深度+1, 第二层深度等于第三层深度+1, 如果结点没有子结点, 则是最大深度.
 代码如下所示: 先判断左子树深度, 再判断右子树深度, 比较两个深度最大的就是这个结点的最大深度, 依次递归查找.
 */
class Problem104Solution1 {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        return maxDepth(root, depth: 1)
    }
    
    func maxDepth(_ root: TreeNode?, depth: Int) -> Int {
        guard let root = root else { return depth - 1 }
        
        let leftDepth = maxDepth(root.left, depth: depth + 1)
        let rightDepth = maxDepth(root.right, depth: depth + 1)
        return max(leftDepth, rightDepth)
    }
}
