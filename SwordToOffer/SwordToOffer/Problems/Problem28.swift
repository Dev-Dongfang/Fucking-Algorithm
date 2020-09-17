//
//  Problem28.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/10.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation


/**
 剑指 Offer 28. 对称的二叉树
 请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和它的镜像一样，那么它是对称的。

 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
 */


/**
 解决方案：遍历，判断左右子树是否相同。
    这里需要注意的是，遍历左右子树时候需要定义新的比较函数，左子树的比较路径和右子树的比较路径是不同的。
 */
class Problem28Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return root == nil ? true : compare(left: root?.left, right: root?.right)
    }
    
    private func compare(left: TreeNode?, right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left?.val != right?.val {
            return false
        }else{
            let res1 = compare(left: left?.left, right: right?.right)
            let res2 = compare(left: left?.right, right: right?.left)
            return res1 && res2
        }
        
    }
}
