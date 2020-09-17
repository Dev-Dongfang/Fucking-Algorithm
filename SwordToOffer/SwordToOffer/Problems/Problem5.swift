//
//  Problem5.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/11.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation


/**
 剑指 Offer 05. 替换空格
 请实现一个函数，把字符串 s 中的每个空格替换成"%20"。

 示例 1：
 输入：s = "We are happy."
 输出："We%20are%20happy."
  

 限制：
 0 <= s 的长度 <= 10000
 */


/**
 解题思路
 1 .最无脑的方法就是从前开始遍历，找到空格后将空格替换成'%20'，这样做缺点是，数组中元素可能发生大量的移动，消耗更多的时间和性能。
 2.为了避免方法1中的缺点，我们可以用第一次遍历匹配所有的空格数量，申请响应的空间大小，第二次遍历从后向前直接将元素放到目标位置，减少搬迁数量。
 3.使用辅助数组，直接遍历将数字放到新的数组中去。
 */
class Problem5 {
    func replaceSpace(_ s: String) -> String {
        var charArr = [Character]()
        let whiteSpaceAscii = Character(" ").asciiValue
        for char in s {
            if char.asciiValue == whiteSpaceAscii {
                charArr.append(contentsOf: ["%","2","0"])
            }else{
                charArr.append(char)
            }
        }
        return String(charArr)
    }
}
