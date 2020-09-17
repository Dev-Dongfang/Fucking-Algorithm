//
//  Problem7.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/11.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation


/**
 输入某二叉树的前序遍历和中序遍历的结果，请重建该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。

 例如，给出
 前序遍历 preorder = [3,9,20,15,7]
 中序遍历 inorder = [9,3,15,20,7]
 返回如下的二叉树：
     3
    / \
   9  20
     /  \
    15   7

 限制：
 0 <= 节点个数 <= 5000
 */

/**
 分析：
    分析发现，从前序遍历中我们总是能得到二叉树的根节点；从中序遍历中我们能得到二叉树左子树和右子树的范围区间（以根节点为分割点），以此为介入点，我们可以递归的分别构建根节点，然后左子树、右子树，然后重建成完整的二叉树。
 解决方案：
    解决方法如上分析，代码见！
 */

class Problem7Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard preorder.count > 0 else { return nil }
        
        //构建根节点
        let rootVal = preorder[0]
        let root = TreeNode(preorder[0])

        //只要有根节点，那么这个节点一定在中序中存在，所以这里强解包是安全的
        let rootIndexInInorder = inorder.firstIndex(of: rootVal)!
        let leftCount = rootIndexInInorder
        let rightCount = inorder.count - 1 - rootIndexInInorder
        //构建左子树
        if leftCount > 0 {
            let leftInorder = inorder.prefix(leftCount)
            let leftPreorder = preorder.prefix(leftCount + 1).dropFirst()
            root.left = buildTree(Array(leftPreorder), Array(leftInorder))
        }
        //构建右子树
        if rightCount > 0 {
            let rightInorder = inorder.suffix(rightCount)
            let rightPreorder = preorder.suffix(rightCount)
            root.right = buildTree(Array(rightPreorder), Array(rightInorder))
        }
        
        return root
    }
}
