//
//  Problem31.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/16.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 剑指 Offer 31. 栈的压入、弹出序列
 输入两个整数序列，第一个序列表示栈的压入顺序，请判断第二个序列是否为该栈的弹出顺序。假设压入栈的所有数字均不相等。例如，序列 {1,2,3,4,5} 是某栈的压栈序列，序列 {4,5,3,2,1} 是该压栈序列对应的一个弹出序列，但 {4,3,5,1,2} 就不可能是该压栈序列的弹出序列。
 */


/**
 解决方案:
 */
class Problem31Solution {
    func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
        guard pushed.count == popped.count else { return false }
        if pushed.count == 0 { return true }
        
        var dummyStack = [Int]()
        
        var popIndex = 0
        for val in pushed {
            dummyStack.append(val)
            while popIndex < popped.count && dummyStack.last == popped[popIndex] {
                dummyStack.removeLast()
                popIndex += 1
            }
        }
        
        return dummyStack.isEmpty && popIndex == popped.count
    }
}
