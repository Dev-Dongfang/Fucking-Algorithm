//
//  3_LongestSubstringWithoutRepeatingCharacters.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/10/11.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation

/*
 Given a string, find the length of the longest substring without repeating characters.
 */



/// 算法如下所示,通过删除删除多余if语句,替换strArray.enumerated()等, ac时间从120ms缩减到64ms.
class Problem3Solution1 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else {return 0}
        
        var tmpDict = [Character: Int]()        //存放字符
        var length = -1                        //记录长度
        var currentStart = 0                    //当前不重复字符的起点
        let strArray = Array(s)
        for index in 0..<strArray.count {
            if let existIndex = tmpDict[strArray[index]], existIndex >= currentStart {
                //纪录长度
                length = max(length, index - currentStart)
                //更新开始位置
                currentStart = existIndex + 1
            }
            //将字符存放入字典中&更新字符最后出现的位置
            tmpDict[strArray[index]] = index
        }
        
        if length < s.count - currentStart {
            length = s.count - currentStart
        }
        
        return length == -1 ? s.count : length
    }
}


/*
 1.遍历字符串元素,遇到字典有有的字符则记录长度,更新字符最后出现的位置(index);更新不重复字符的起点
 
 */
