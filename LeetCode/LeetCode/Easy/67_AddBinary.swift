//
//  67_AddBinary.swift
//  LeetCode
//
//  Created by 韦东方 on 2018/11/30.
//  Copyright © 2018 Wei Walden. All rights reserved.
//

import Foundation



/// 解法1: 分段拆分并计算
class Problem67Solution1 {
    
    func addBinary(_ a: String, _ b: String) -> String {
        //如果有一个空串,则提前退出
        guard a.count > 0 && b.count > 0 else {
            return a.count > 0 ? a : b
        }
        
        //分解字符串,开始逐位的比较
        let chars: [Int: Character] = [0:"0", 1:"1"]
        let aArray = Array(Array(a).reversed())
        let bArray = Array(Array(b).reversed())
        var resultArray = [Character]()
        var index = 0, c = 0
        //循环分别获取aArray和bArray的每个元素,并相加
        while index < aArray.count && index < bArray.count {
            let aInt = Int("\(aArray[index])")!
            let bInt = Int("\(bArray[index])")!
            resultArray.append(chars[(aInt + bInt + c) % 2]!)
            c = (aInt + bInt + c) / 2
            index += 1
        }
        //如果aArray有剩余元素,则追加
        while index < aArray.count {
            let aInt = Int("\(aArray[index])")!
            resultArray.append(chars[(aInt + c) % 2]!)
            c = (aInt + c) / 2
            index += 1
        }
        //如果bArray有剩余元素,则追加
        while index < bArray.count {
            let bInt = Int("\(bArray[index])")!
            resultArray.append(chars[(bInt + c) % 2]!)
            c = (bInt + c) / 2
            index += 1
        }
        
        if c == 1 {
            resultArray.append("1")
        }
        return String(resultArray.reversed())
    }
}






/// 解法2:统一处理
class Problem67Solution2 {
    
    func addBinary(_ a: String, _ b: String) -> String {
        //分解字符串,开始逐位的比较
        let chars: [Int: Character] = [0:"0", 1:"1"]
        let aArray = Array(Array(a)), bArray = Array(Array(b))
        var resultArray = [Character]()
        var aIndex = aArray.count - 1, bIndex = bArray.count - 1
        var carry = 0
        while aIndex >= 0 || bIndex >= 0 {
            var sum = carry
            if aIndex >= 0 {
                sum += Int("\(aArray[aIndex])")!
                aIndex -= 1
            }
            if bIndex >= 0 {
                sum += Int("\(bArray[bIndex])")!
                bIndex -= 1
            }
            resultArray.append(chars[sum % 2]!)
            carry = sum / 2
        }
        if carry == 1 { resultArray.append("1") }
        
        return String(resultArray.reversed())
    }
}




/// 解法3:类似解法2, 但是不使用类型转换, 证明了String转Int的类型转换是一个非常耗时的操作;
class Problem67Solution3 {
    
    func addBinary(_ a: String, _ b: String) -> String {
        //分解字符串,开始逐位的比较
        let chars: [Int: Character] = [0:"0", 1:"1"]
        let ints: [Character: Int] = ["0": 0, "1": 1]
        let aArray = Array(Array(a)), bArray = Array(Array(b))
        var resultArray = [Character]()
        var aIndex = aArray.count - 1, bIndex = bArray.count - 1
        var carry = 0
        while aIndex >= 0 || bIndex >= 0 {
            var sum = carry
            if aIndex >= 0 {
                sum += ints[aArray[aIndex]]!
                aIndex -= 1
            }
            if bIndex >= 0 {
                sum += ints[bArray[bIndex]]!
                bIndex -= 1
            }
            resultArray.append(chars[sum % 2]!)
            carry = sum / 2
        }
        if carry == 1 { resultArray.append("1") }
        
        return String(resultArray.reversed())
    }
}



