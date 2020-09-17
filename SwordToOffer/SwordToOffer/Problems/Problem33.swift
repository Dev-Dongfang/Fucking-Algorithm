//
//  Problem33.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/13.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation


/**
 剑指 Offer 33. 二叉搜索树的后序遍历序列
 输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历结果。如果是则返回 true，否则返回 false。假设输入的数组的任意两个数字都互不相同。
 */

/**
 分析：二叉搜索树的特点：左子树都比根节点小，右子树都比根节点大。
    根据这个特点，我们可以先找出根节点，然后判断其左子树和右子树都否都是合法的，使用递归的方法可以较简单的解决问题。
 */

class Problem33 {
    func verifyPostorder(_ postorder: [Int]) -> Bool {
        guard postorder.count > 1 else { return true }
        
        let rootValue = postorder.last!
        
        //查找左子树，从0开始，小于根节点的都是左子树
        var index = 0
        while index < (postorder.count - 1) && postorder[index] < rootValue {
            index += 1
        }
        let rightStartIndex = index
        //查找右子树是否合法，从大于根节点的位置开始，其后的值都应该大于根节点，否则不合法
        while index < (postorder.count - 1) && postorder[index] > rootValue {
            index += 1
        }
        if index == postorder.count - 1 {
            //递归判断左子树和右子树是否合法
            let left = postorder[0..<rightStartIndex]
            let right = postorder[rightStartIndex..<(postorder.count - 1)]
            return verifyPostorder(Array(left)) && verifyPostorder(Array(right))
        }else{
            return false
        }
    }
}
