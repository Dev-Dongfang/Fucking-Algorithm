//
//  98_ValidateBinarySearchTree.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/6/5.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation


/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Problem98Solution1 {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return judge(node: root, lowwer: nil, upper: nil)
    }
    
    private func judge(node: TreeNode?, lowwer: Int?, upper: Int?) -> Bool {
        guard let node = node else { return true }
        
        let val = node.val
        if let lowwer = lowwer, lowwer >= val { return false }
        if let upper = upper, upper <= val { return false }
        
        let leftValid = judge(node: node.left, lowwer: lowwer, upper: val)
        let rightValid = judge(node: node.right, lowwer: val, upper: upper)
        
        return leftValid && rightValid
    }
}
