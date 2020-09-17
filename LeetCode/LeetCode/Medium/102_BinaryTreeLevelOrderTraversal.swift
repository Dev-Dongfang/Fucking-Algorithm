//
//  102_BinaryTreeLevelOrderTraversal.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/6/10.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation



/*
 解法1: 遍历, 将每一层的数据存储起来存储每层的结点和每层结点的结果, 最终返回.
    解法没问题, 但是时间复杂度太高, 在leetcode上排到了最后...
 */
class Problem102Solution1 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var results = [[Int]]()
        guard let root = root else { return results }
        travelLayer(result: &results, nodes: [root])
        return results
    }
    
    func travelLayer(result: inout [[Int]], nodes: [TreeNode]) {
        guard !nodes.isEmpty else { return }
        var layerResult = [Int]()
        var nextLayerNodes = [TreeNode]()
        for node in nodes {
            layerResult.append(node.val)
            if let leftNode = node.left {
                nextLayerNodes.append(leftNode)
            }
            if let rightNode = node.right {
                nextLayerNodes.append(rightNode)
            }
        }
        
        if layerResult.isEmpty == false {
            result.append(layerResult)
        }
        if nextLayerNodes.isEmpty == false {
            travelLayer(result: &result, nodes: nextLayerNodes)
        }
    }
}


/*
 解法2: 深度优先算法
    遍历每个结点并标记结点对应的深度,如果结点对应深度的在数组中不存在,则创建并添加,如果存在则取出来并添加元素.
 */
class Problem102Solution2 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var results = [[Int]]()
        guard let root = root else { return results }
        travelLayer(result: &results, node: root, height: 0)
        return results
    }
    
    func travelLayer(result: inout [[Int]], node: TreeNode?, height: Int) {
        guard let node = node else { return }
        if height >= result.count {
            result.append([Int]())
        }
        result[height].append(node.val)
        travelLayer(result: &result, node: node.left, height: height + 1)
        travelLayer(result: &result, node: node.right, height: height + 1)
    }
}


/*
 解法3:基于解法1的思路,使用循环实现
    解法2的时间复杂度优于解法1,但是事实上并没有快多少. 参考了leetcode上其它的解法, 发现耗时短的算法基本上是基于第一种思路,使用循环实现的代码.进一步证明了循环比递归更快, 递归比较慢的原因是递归需要开辟新的堆栈,创建临时变量,销毁堆栈返回. 代码指令条数要多于循环,所占用栈空间也要比循环多.
 */
