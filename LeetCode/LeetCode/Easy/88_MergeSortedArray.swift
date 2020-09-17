//
//  88_MergeSortedArray.swift
//  LeetCode
//
//  Created by 韦东方 on 2018/11/9.
//  Copyright © 2018 Wei Walden. All rights reserved.
//

import Foundation


class Problem88Solution1 {
    //思路是这样的, 既然合并的两个数据要求必须合并到nums1中去. 那么应该尽量避免移动nums1中的数据,首先nums1有足够大的空间, 所以我们从大到小排序, 最大的放在最右边,依次类推即可
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var mLastIndex = m - 1, nLastIndex = n - 1, currentIndex = m + n - 1
        while mLastIndex >= 0 && nLastIndex >= 0 {
            if nums1[mLastIndex] > nums2[nLastIndex] {
                nums1[currentIndex] = nums1[mLastIndex]
                mLastIndex -= 1
            }else{
                nums1[currentIndex] = nums2[nLastIndex]
                nLastIndex -= 1
            }
            currentIndex -= 1
        }
        if nLastIndex > 0 {
            while nLastIndex > 0 {
                nums1[currentIndex] = nums2[nLastIndex]
                nLastIndex -= 1
                currentIndex -= 1
            }
        }
    }
}
