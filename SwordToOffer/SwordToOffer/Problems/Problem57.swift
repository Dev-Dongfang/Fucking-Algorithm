//
//  Problem57.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/13.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation


/**
 剑指 Offer 57. 和为s的两个数字
 输入一个递增排序的数组和一个数字s，在数组中查找两个数，使得它们的和正好是s。如果有多对数字的和等于s，则输出任意一对即可。

 示例 1：
 输入：nums = [2,7,11,15], target = 9
 输出：[2,7] 或者 [7,2]
 
 示例 2：
 输入：nums = [10,26,30,31,47,60], target = 40
 输出：[10,30] 或者 [30,10]
  

 限制：
 1 <= nums.length <= 10^5
 1 <= nums[i] <= 10^6
 */

/*
 这个题目有两个解决方案：
 方案一：使用哈希表。遍历并将数据和其Index存放到哈希表中，然后根据目标值计算出存在的值，查找哈希表中是否存在。这样时间复杂度和空间复杂度都是O(n)
 方案二：由于本题中的数据是排序数组，因此我们可以定义两个指针分别指向数组的开头和结尾，然后用夹逼法找到和为S的数字
 */


//方案2解法
class Problem57 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 2 else { return [] }
        
        var left = 0, right = nums.count - 1
        while left < right {
            if target > nums[left] + nums[right] {
                left += 1
            }else if target < nums[left] + nums[right] {
                right -= 1
            }else{
                return [nums[left], nums[right]]
            }
        }
        return []
    }
}




/**
 剑指 Offer 57 - II. 和为s的连续正数序列
 输入一个正整数 target ，输出所有和为 target 的连续正整数序列（至少含有两个数）。

 序列内的数字由小到大排列，不同序列按照首个数字从小到大排列。
 */

/**
解决方案：使用如上相同的方法，夹逼法，先试试吧！
 */
class Problem57_2 {
    //夹逼法第一版
    func findContinuousSequence(_ target: Int) -> [[Int]] {
        var res = [[Int]]()
        var item = [Int]()
        
        var n = 1, sum = 0
        while n <= target {
            if sum < target {
                item.append(n)
                sum += n
                n += 1
            }else if sum >= target {
                let first = item.removeFirst()
                sum -= first
            }
            if sum == target {
                res.append(item)
                let first = item.removeFirst()
                sum -= first
            }
        }
        
        return res
    }
    
    
    //夹逼法第二版
    //此代码是基于上一版本的优化，原理还是一样的
    //优化点：循环次数减少一半
    func findContinuousSequence2(_ target: Int) -> [[Int]] {
        var res = [[Int]]()
        var item = [Int]()
        
        var n = 1, sum = 0
        while n <= (target / 2 + 1) {
            while sum < target {
                item.append(n)
                sum += n
                n += 1
            }
            while sum > target {
                let first = item.removeFirst()
                sum -= first
            }
            if sum == target {
                res.append(item)
                let first = item.removeFirst()
                sum -= first
            }
        }
        
        return res
    }
    
    //夹逼法第三版
    //优化点：每次向数组中增删数据是比较耗时的操作，这里可以想办法用left、right指针代表一个区间
    func findContinuousSequence3(_ target: Int) -> [[Int]] {
        var res = [[Int]]()
        
        var n = 1, sum = 0
        var left = 1, right = 1
        while n <= (target / 2 + 1) {
            while sum < target {
                sum += n
                right += 1
                n += 1
            }
            while sum > target {
                sum -= left
                left += 1
            }
            if sum == target {
                res.append(Array(left..<right))
                sum -= left
                left += 1
            }
        }
        
        return res
    }
}
