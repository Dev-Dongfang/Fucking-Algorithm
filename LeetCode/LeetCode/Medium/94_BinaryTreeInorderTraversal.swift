//
//  94_BinaryTreeInorderTraversal.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/6/5.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation

/*
 中序遍历二叉树
 */

class Problem94Solution1 {
    
    private var results = [Int]()
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        _ = inorderTraversal(root.left)
        results.append(root.val)
        _ = inorderTraversal(root.right)
        return results
    }
}
