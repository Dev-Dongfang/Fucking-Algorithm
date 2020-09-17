//
//  50_Pow(x,n).swift
//  LeetCode
//
//  Created by 韦东方 on 2018/11/7.
//  Copyright © 2018 Wei Walden. All rights reserved.
//

import Foundation
/*
 Implement pow(x, n), which calculates x raised to the power n (xn).
 
 //方法1:将幂运算转换成位移运算, 但是会导致密云算中出现小数,这时候好像更加不好算了...  错误的计算方法, 还是数学没学好啊...
 //方法2:最笨的方法就是循环x相乘n次. 目测这种方法时间复杂度不过关.
 */



/// 参考leetcode上面的一种解决方案, 利用幂的幂来化解单纯的幂运算
/// 原理大概是这样的, 比如3^10 == ((3^2)^2)^2 * 3 * 3, 很巧妙的算法, 但是没有什么技术含量
class Problem50Solution1 {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 { return 1 }
        let tmp = myPow(x, n / 2)
        if n % 2 == 0 {
            return tmp * tmp
        }else if n > 0 {
            return tmp * tmp * x
        }else{
            return tmp * tmp / x
        }
    }
}



