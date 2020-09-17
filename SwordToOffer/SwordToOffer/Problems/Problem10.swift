//
//  Problem10.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/9.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation



/**
 剑指 Offer 10- I. 斐波那契数列
 写一个函数，输入 n ，求斐波那契（Fibonacci）数列的第 n 项。斐波那契数列的定义如下：

 F(0) = 0,   F(1) = 1
 F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
 斐波那契数列由 0 和 1 开始，之后的斐波那契数就是由之前的两数相加而得出。

 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。
 */

class Problem10_1_Solution1 {
    func fib(_ n: Int) -> Int {
        guard n > 1 else { return n }
        
        var f1 = 1
        var f2 = 1
        for _ in 2..<n {
            (f1, f2) = (f2, f1 + f2)
        }
        
        return f2 % 1000000007
    }
}








/**
 剑指 Offer 10- II. 青蛙跳台阶问题
 一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。

 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。
 */

/**
 解决方案1：斐波那锲序列
 */
class Problem10_2_Solution1 {
    func numWays(_ n: Int) -> Int {
        guard n > 0 else { return 1 }
        guard n > 2 else { return n }
        
        var s1 = 1, s2 = 2
        for _ in 2..<n {
            (s1, s2) = (s2, s1 + s2)
        }
        
        return s2 % 1000000007
    }
}



/**
 解决方案2：递归法
 */
class Problem10_2_Solution2 {
    private var cache = [0: 1, 1: 1, 2: 2]
    func numWays(_ n: Int) -> Int {
        if let n = cache[n] {
            return n
        }else{
            let sum = numWays(n - 1) + numWays(n - 2)
            cache[n] = sum
            return sum
        }
    }
}
