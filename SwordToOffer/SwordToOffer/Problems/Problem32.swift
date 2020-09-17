//
//  Problem32.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/16.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation


/**
 剑指 Offer 32 - I. 从上到下打印二叉树
 从上到下打印出二叉树的每个节点，同一层的节点按照从左到右的顺序打印。
 */

/**
 解决方案:使用辅助栈.
 */
class Problem32_1_Solution {
    func levelOrder(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        let dummyStack = Queue<TreeNode>()
        var vals = [Int]()
        dummyStack.push(root)
        
        while dummyStack.isEmpty == false {
            let node = dummyStack.pop()!
            vals.append(node.val)
            if let left = node.left {
                dummyStack.push(left)
            }
            if let right = node.right {
                dummyStack.push(right)
            }
            
        }
        
        return vals
    }
}





/**
 剑指 Offer 32 - II. 从上到下打印二叉树 II
 从上到下按层打印二叉树，同一层的节点按从左到右的顺序打印，每一层打印到一行。
 */

/**
 解决方案:
    同第一题一样的解决方案,区别在于, 每次遍历完毕一层, 将结果存储起来即可.
 */

class Problem32_2_Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var dummyStack: [TreeNode] = [root]
        var vals = [[Int]]()
        while dummyStack.isEmpty == false {
            var tmpStack = [TreeNode]()
            var tmpVals = [Int]()
            for node in dummyStack {
                tmpVals.append(node.val)
                if let left = node.left {
                    tmpStack.append(left)
                }
                if let right = node.right {
                    tmpStack.append(right)
                }
            }
            dummyStack = tmpStack
            vals.append(tmpVals)
        }
        return vals
    }
}




/**
 剑指 Offer 32 - III. 从上到下打印二叉树 III
 请实现一个函数按照之字形顺序打印二叉树，即第一行按照从左到右的顺序打印，第二层按照从右到左的顺序打印，第三行再按照从左到右的顺序打印，其他行以此类推。
 */

/**
 解决方案: 大体上和上面的一样, 只需要根据不同的行, 变换遍历或者输出的方向即可
 */

class Problem32_3_Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var dummyStack: [TreeNode] = [root]
        var vals = [[Int]]()
        var flag = 1
        while dummyStack.isEmpty == false {
            var tmpStack = [TreeNode]()
            var tmpVals = [Int]()
            for node in dummyStack {
                tmpVals.append(node.val)
                if let left = node.left {
                    tmpStack.append(left)
                }
                if let right = node.right {
                    tmpStack.append(right)
                }
            }
            dummyStack = tmpStack
            if flag & 1 == 0 {
                vals.append(tmpVals.reversed())
            }else{
                vals.append(tmpVals)
            }
            flag += 1
        }
        return vals
    }
}
