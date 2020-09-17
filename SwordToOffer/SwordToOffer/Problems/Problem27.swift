//
//  Problem27.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/10.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 剑指 Offer 27. 二叉树的镜像
 请完成一个函数，输入一个二叉树，该函数输出它的镜像。
 */

/**
 解决方案：递归遍历，改变左右子树的引用。
 */
class Problem27Solution {
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return nil }
        
        let tmp = root?.left
        root?.left = root?.right
        root?.right = tmp
        mirrorTree(root?.left)
        mirrorTree(root?.right)
        return root
    }
}
