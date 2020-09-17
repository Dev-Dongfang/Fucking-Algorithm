//
//  201_BitwiseANDofNumbersRange.swift
//  LeetCode
//
//  Created by 韦东方 on 2020/3/22.
//  Copyright © 2020 Wei Walden. All rights reserved.
//

import Foundation


class Problem201Solution1 {
    //又是一个bit位操作题目, 这道题目的关键在于找到规律,我们来看范围[26, 30]，它们的二进制如下：11010　　11011　　11100　　11101　　11110. 我们发现它们二进制的左边都是相同的,只是右边开始不同.
    //因此我们可以先拿到最大的数字n,让它最右边的数字1变成0,然后和最小的数字比较,如果币最小的数字大,则继续重复操作,直到找到第一个比左边小的即可.
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        var n = n
        while n > m {
            n &= n - 1
        }
        return n
    }
}
