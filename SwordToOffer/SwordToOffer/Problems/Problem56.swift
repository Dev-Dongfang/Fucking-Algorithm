//
//  Problem56.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/13.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation


/**
 剑指 Offer 56 - I. 数组中数字出现的次数
 一个整型数组 nums 里除两个数字之外，其他数字都出现了两次。请写程序找出这两个只出现一次的数字。要求时间复杂度是O(n)，空间复杂度是O(1)。

 示例 1：
 输入：nums = [4,1,4,6]
 输出：[1,6] 或 [6,1]
 
 示例 2：
 输入：nums = [1,2,10,4,1,4,3,3]
 输出：[2,10] 或 [10,2]
  

 限制：
 2 <= nums.length <= 10000
 */


/**
 解决方案：典型的利用异或求解的问题
    解题分为三步，
    第一步：将所有的数字全部异或，得到的结果是两个不相等数字的异或结果。因为其它出现两个的数字异或之后都会变成0.
    第二步：将数组分割成两组，每组包含一个只出现一次的数字。这里需要用到两个数字异或的结果。
    第三步：将两组数字分别异或求值，最后得到的两个数字就是最终的数字。
 */
class Problem56 {
    func singleNumbers(_ nums: [Int]) -> [Int] {
        var ret = 0
        for num in nums {
            ret ^= num
        }
        
        //找分割点
        var div = 1
        while (ret & div) == 0 {
            div = div << 1
        }
        
        var target1 = 0, target2 = 0
        for num in nums {
            if (num & div) > 0 {
                target1 ^= num
            }else{
                target2 ^= num
            }
        }
        return [target1, target2]
    }
}






/**
 剑指 Offer 56 - II. 数组中数字出现的次数 II
 在一个数组 nums 中除一个数字只出现一次之外，其他数字都出现了三次。请找出那个只出现一次的数字。

 示例 1：
 输入：nums = [3,4,3,3]
 输出：4
 
 示例 2：
 输入：nums = [9,1,7,9,7,9,7]
 输出：1

 限制：
 1 <= nums.length <= 10000
 1 <= nums[i] < 2^31
 */

/**
 解题思路：
 如下图所示，考虑数字的二进制形式，对于出现三次的数字，各 二进制位 出现的次数都是 33 的倍数。
 因此，统计所有数字的各二进制位中 11 的出现次数，并对 33 求余，结果则为只出现一次的数字。

https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-ii-lcof/solution/mian-shi-ti-56-ii-shu-zu-zhong-shu-zi-chu-xian-d-4/
 */

class Problem56_2 {
    func singleNumber(_ nums: [Int]) -> Int {
//        var counts = [Int](repeating: 0, count: 64)
//        for num in nums {
//            var num = num
//            var detect = 1
//            if num > 0 {
//                if num & detect > 0 {
//                    counts[]
//                }
//            }
//        }
        return 0
    }
}
