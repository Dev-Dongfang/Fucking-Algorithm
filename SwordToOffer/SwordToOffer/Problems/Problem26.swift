//
//  Problem26.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/13.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 剑指 Offer 26. 树的子结构
 输入两棵二叉树A和B，判断B是不是A的子结构。(约定空树不是任意一个树的子结构)

 B是A的子结构， 即 A中有出现和B相同的结构和节点值。

 例如:
 给定的树 A:

      3
     / \
    4   5
   / \
  1   2
 给定的树 B：

    4
   /
  1
 返回 true，因为 B 与 A 的一个子树拥有相同的结构和节点值。
 */


/**
 解决方案：递归判断每个节点是否是相同
    第一个递归遍历A树的每个节点，判断和B树的根节点是否相同，相同的话将相同的两个节点交给第二个递归判断。
    第二个递归比对两个树上的节点值是否完全相等，如果B树比对完毕发现都相等则，表示能找到，否则就是找不到。
 */
class Problem26 {
    func isSubStructure(_ A: TreeNode?, _ B: TreeNode?) -> Bool {
        if A == nil {
            return false
        }
        if A?.val == B?.val && compare(tree1: A, tree2: B) {
            return true
        }else{
            return isSubStructure(A?.left, B) || isSubStructure(A?.right, B)
        }
    }
    
    private func compare(tree1: TreeNode?, tree2: TreeNode?) -> Bool {
        if tree2 == nil {
            return true
        }else if tree1 == nil {
            return false
        }
        
        if tree1?.val == tree2?.val {
            return compare(tree1: tree1?.left, tree2: tree2?.left)
                && compare(tree1: tree1?.right, tree2: tree2?.right)
        }else{
            return false
        }
    }
}
