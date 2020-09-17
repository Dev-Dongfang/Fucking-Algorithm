//
//  144_BinaryTreePreorderTraversal.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/6/5.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation

/*
 前序遍历二叉树
 */

class Problem144Solution1 {
    
    private var results = [Int]()
    
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        results.append(root.val)
        _ = preorderTraversal(root.left)
        _ = preorderTraversal(root.right)
        return results
    }
}
