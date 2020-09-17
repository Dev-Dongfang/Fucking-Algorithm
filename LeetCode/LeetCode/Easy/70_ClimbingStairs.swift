//
//  70_ClimbingStairs.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/9/30.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation


/*
 You are climbing a stair case. It takes n steps to reach to the top.
 
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 
 Note: Given n will be a positive integer.
 
 经典的爬楼梯问题, 可以使用递归方法解决.
 */


/// 解法1: 遍历每种走法, 从前往后, 一步一步的计算走法的个数
// n个台阶, 第一步有两种走法,走一步或者走两步, 使用递归计算总的步数
// 这是最暴力的一种方法, 提交代码得知, 超时...
class Problem70Solution1 {
    func climbStairs(_ n: Int) -> Int {
        if n == 0 {return 0}
        if n == 1 {return 1}
        if n == 2 {return 2}
        return climbStairs(n - 1) + climbStairs(n - 2)
    }
}




/// 解法2:分析发现,实际上解法1发生了很多很多的重复运算, 怎么才能减少冗余运算呢?
// 能不能通过确定有n个台阶时候的走法来确定结果呢? !!!!!
// 解法1的方法倒着推, 第一步有1种走法,第二步有两种走法,第三步有两种走法,走一个台阶到达第第三步或者走走两个台阶到达第三步 两个走法可能性是S1+S2=S3=3; 同理,第四步S2+S3=S4=5;S3+S4=S5=8,类似于斐波那契的解法
// 验证得知,这是一个8ms的解决方法,leetCode上的最优解.哈哈哈哈哈!!!
// 时间复杂度O(n), 空间复杂度O(1)
class Problem70Solution2 {
    func climbStairs(_ n: Int) -> Int {
        if n == 0 {return 0}
        if n == 1 {return 1}
        if n == 2 {return 2}
        var fib = (1, 2)
        for _ in 3...n {
            fib = (fib.1, fib.0 + fib.1)
        }
        return fib.1
    }
}






/// 参考leetCode上面的解法, 根据斐波那契数列, 得出第n个斐波那契数列的数字,从而得出爬行的步数.
// 斐波那契数列公式: (pow((1+sqrt5)/2,setps+1) - pow((1-sqrt5)/2,setps+1)) / sqrt5
//Time complexity : O(log(n))O(log(n)). powpow method takes log(n)log(n) time. Space complexity : O(1)O(1). Constant space is used.
class Problem70Solution3 {
    func climbStairs(_ n: Int) -> Int {
        let setps = Double(n)
        let sqrt5 = sqrt(5)
        return Int((pow((1+sqrt5)/2,setps+1) - pow((1-sqrt5)/2,setps+1)) / sqrt5)
    }
}






