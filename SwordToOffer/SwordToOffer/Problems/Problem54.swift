//
//  Problem54.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/14.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 剑指 Offer 54. 二叉搜索树的第k大节点
 给定一棵二叉搜索树，请找出其中第k大的节点。
 */

/**
 分析：二叉搜索树的中序遍历是有序的，并且是从小到大的顺序；那么反过来遍历就是倒序的，我们只需要将中序遍历反过来遍历，遍历到的第k个节点就是第K大的节点。
 */


class Problem54 {
    func kthLargest(_ root: TreeNode?, _ k: Int) -> Int {
        if root == nil {
            return -1
        }
        
        var k = k
        let node = lcr(root: root, k: &k)
        return node?.val ?? -1
    }
    
    private func lcr(root: TreeNode?, k: inout Int) -> TreeNode? {
        if root == nil { return nil }
        
        if let right = lcr(root: root?.right, k: &k) {
            return right
        }
        
        k -= 1
        if k == 0 {
            return root
        }
        
        if let left = lcr(root: root?.left, k: &k) {
            return left
        }
        
        return nil
    }
}
