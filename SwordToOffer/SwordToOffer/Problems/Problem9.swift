//
//  Problem9.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/11.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation



/**
 剑指 Offer 09. 用两个栈实现队列
 用两个栈实现一个队列。队列的声明如下，请实现它的两个函数 appendTail 和 deleteHead ，分别完成在队列尾部插入整数和在队列头部删除整数的功能。(若队列中没有元素，deleteHead 操作返回 -1 )
 */


/**
 解决方案：
    方案就是去实现吧！
    入队时候，将元素放到第一个栈中，出队时候将第二个栈中元素出队，如果第二个队中没有元素了，就将第一个队中元素入栈到第二个队列中。
 
 拓展：两个队列如何实现一个栈？
    方法一：两个队列，总是保持一个队列为空，入栈时候，将元素入栈到非空队列；出栈时候将非空队列元素转移到空队列并将最后一个元素弹出。
    方法二：两个队列，总是保持一个队列为空，入栈元素将元素入队到空队列，然后将非空队列元素全部出队并入队即可。
 */
class Problem9Solution1 {
    class CQueue {
        
        var stack1 = Stack<Int>()
        var stack2 = Stack<Int>()
        
        init() {}
        
        func appendTail(_ value: Int) {
            stack1.push(value)
        }
        
        func deleteHead() -> Int {
            if stack2.count == 0 {
                while stack1.count > 0 {
                    stack2.push(stack1.pop()!)
                }
            }
            return stack2.pop() ?? -1
        }
    }
}
