//
//  14_.swift
//  LeetCode
//
//  Created by 韦东方 on 2018/11/12.
//  Copyright © 2018 Wei Walden. All rights reserved.
//

import Foundation


/*
 Write a function to find the longest common prefix string amongst an array of strings.
 If there is no common prefix, return an empty string "".
 */


/// 自己实现的算法, 代码量相比讨论区的多了点, 因为我想控制每次字符串的查找和比对, 拒绝使用hasPrefix这样的方法;
///     24ms AC, 时间不算最短, 算法不算太好. 还好吧, 一般.
/// 算法原理是依次比较两个字符串中相同的元素的个数, 记录下来继续比较. 麻烦的点在于边界条件比较多, 需要格外小心边界条件.
class Problem14Solution1 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
        guard strs.count > 1 else { return strs[0] }
        
        let reference = Array(strs[0])
        var index = reference.count - 1
        
        for i in 1..<strs.count {
            let idx = samePrefix(reference, index, Array(strs[i]))
            if idx < 0 { return "" }
            index = idx
        }
        
        return String(reference[0...index])
    }
    
    private func samePrefix(_ reference: [Character], _ referenceIndex: Int, _ arr2: [Character]) -> Int {
        let minIndex: Int = min(referenceIndex, arr2.count - 1)
        guard minIndex >= 0 else { return -1 }
        for i in 0...minIndex {
            if reference[i] != arr2[i] { return i - 1 }
        }
        return minIndex
    }
}


/// 有看到另一种解决方案, 先查找到字符串数组中长度最小的字符串, 以此为参考进行比较.
