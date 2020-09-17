//
//  Problem30.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/10.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation


/**
 剑指 Offer 30. 包含min函数的栈
 定义栈的数据结构，请在该类型中实现一个能够得到栈的最小元素的 min 函数在该栈中，调用 min、push 及 pop 的时间复杂度都是 O(1)。
 */


/**
 解决方案：
 两个栈，一个栈存储正常的数字，两个栈存储当前栈对应的最小数字，push元素时候对比最小栈栈顶元素和当前元素。
 */
class Problem30Solution {
    class MinStack {
        private var container = [Int]()
        private var minContainer = [Int]()
        
        private var currentMin: Int? = nil
        
        init() { }
        
        func push(_ x: Int) {
            container.append(x)
            var minTop = minContainer.last ?? Int.max
            minTop = x < minTop ? x : minTop
            minContainer.append(minTop)
        }
        
        func pop() {
            container.removeLast()
            minContainer.removeLast()
        }
        
        func top() -> Int {
            container.last!
        }
        
        func min() -> Int {
            minContainer.last!
        }
    }
}

