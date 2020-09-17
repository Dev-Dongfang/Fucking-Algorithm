//
//  28_ImplementStrStr.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/10/14.
//  Copyright © 2018 Wei Walden. All rights reserved.
//

import Foundation


/// 这道题目前想到的解决方法有两种,第一种是zui很笨的那种方法,先匹配开头相同的,如果相同则匹配后面的,如果匹配到则直接返回即可 O(n*n)
/// 第二种方法,从第n个位置截取hay字符串的子串,和nelldle字符串比较.
/// 好吧, 事件证明, 方法执行超时....
class Problem28Solution1 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.count > 0 else {return 0}
        guard needle.count <= haystack.count else {return -1}
        //分解haystack和needle
        let haystackChars = Array(haystack)
        let needleChars = Array(needle)
        
        //遍历haystack给二维数组填充数据
        for i in 0..<haystackChars.count {
            var j = 0
            while j < needleChars.count && (i + j) < haystackChars.count {
                if needleChars[j] != haystackChars[i + j] {
                    break
                }
                j += 1
            }
            if j >= needleChars.count {
                return i
            }
        }
        return -1
    }
}


///大概好像还有一种动态规划的解决方案:
// 算法应该是没问题的, 但是超出了内存限制,因此无法AC
class Problem28Solution2 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.count > 0 else {return 0}
        guard needle.count <= haystack.count else {return -1}
        
        //分解haystack和needle
        let haystackChars = Array(haystack)
        let needleChars = Array(needle)
        
        //构建一个二维数组
        var resultArray = Array(repeating: Array(repeating: 0, count: haystackChars.count), count: needleChars.count)
        //遍历haystack给二维数组填充数据
        for (i, element) in haystackChars.enumerated() {
            for (j, char) in needleChars.enumerated() {
                if element == char {
                    if j > 0 && i > 0 {
                        resultArray[j][i] = resultArray[j-1][i-1] + 1
                    }else{
                        resultArray[j][i] = 1
                    }
                    if resultArray[j][i] == needleChars.count {
                        return i - resultArray[j][i] + 1
                    }
                }
            }
        }
        return -1
    }
}




/// 使用swift特性吧!!
/// 使用swift特性`hasPrefix`, 结果是AC, 但是AC的事件达到3976ms, 这结果显然是不能让人满意的. 添加`(haystackChars.count-needle.count)`这样的限制条件之后,AC=16ms, 因此在开发中,即使是很小的优化,也是要做起来的.
class Problem28Solution3 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.count > 0 else {return 0}
        guard needle.count <= haystack.count else {return -1}
        
        //分解haystack和needle
        let haystackChars = Array(haystack)
        for i in 0...(haystackChars.count-needle.count) {
            let subhayStack = String(haystack.suffix(from: haystack.index(haystack.startIndex, offsetBy: i)))
            if subhayStack.hasPrefix(needle) {
                return i
            }
        }
        
        return -1
    }
}




/// 参考别人成功的submission中的最优解
// for循环中每次使用Array.count比西安使用变量记录Count值,然后for循环中使用缓存的Count, 在此题的AC中结果快了20%
class Problem28Solution4 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.count > 0 else {return 0}
        guard needle.count <= haystack.count else {return -1}
        let hayLen = haystack.count, needleLen = needle.count
        
        let haystackArray = Array(haystack), needleArray = Array(needle)
        
        for i in 0...hayLen-needleLen where haystackArray[i] == needleArray.first {
            for j in 0..<needleLen {
                if haystackArray[i + j] != needleArray[j] {
                    break
                }
                if j == needleLen - 1 {
                    return i
                }
            }
        }
        
        return -1
    }
}


