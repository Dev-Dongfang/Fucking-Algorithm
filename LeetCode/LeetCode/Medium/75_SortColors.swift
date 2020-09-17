//
//  75_SortColors.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/6/12.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation

/*
 Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.
 
 Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
 
 Note: You are not suppose to use the library's sort function for this problem.
 
 Example:
 
 Input: [2,0,2,1,1,0]
 Output: [0,0,1,1,2,2]
 Follow up:
 
 A rather straight forward solution is a two-pass algorithm using counting sort.
 First, iterate the array counting number of 0's, 1's, and 2's, then overwrite array with total number of 0's, then 1's and followed by 2's.
 Could you come up with a one-pass algorithm using only constant space?
 */

/*解决方案:
 1.普通排序;
 2.计数排序,遍历一遍, 将所有数据均匀分布在0,1,2三个桶中,合并三个桶中的数据,非原地排序;
 3.两个指针,一前一后,遍历指针从头开始遍历,如果数字是0这和第一个交换,如果是2这和最后一个交换,原地排序.
 */

/// 2.计数排序解决方案
class Problem75Solution1 {
    //计数排序
    func sortColors(_ nums: inout [Int]) {
        guard nums.count > 1 else { return}
        
        //1.遍历数组,统计各个数字出现的次数放在数组C中
        
        //2.从前往后累加数组C
        
        //3.遍历nums数组,从C中取出对应的个数就是要排序数组中的位置, 数组放到数组中后,对应数字-1
        
    }
}



/// 3.两个指针,一前一后,遍历指针从头开始遍历,如果数字是0这和第一个交换,如果是2这和最后一个交换,原地排序.
class Problem75Solution2 {
    func sortColors(_ nums: inout [Int]) {
        guard nums.count > 1 else { return}
        var left = 0, right = nums.count - 1, i = 0
        while i <= right {
            if nums[i] == 0 {
                nums.swapAt(i, left)
                left += 1
            }else if nums[i] == 2{
                nums.swapAt(i, right)
                right -= 1
                i -= 1
            }
            i += 1
            print(nums)
        }
    }
}
