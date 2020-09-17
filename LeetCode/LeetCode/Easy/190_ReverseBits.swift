//
//  190_ReverseBits.swift
//  LeetCode
//
//  Created by 韦东方 on 2019/6/11.
//  Copyright © 2019 Wei Walden. All rights reserved.
//

import Foundation

//00000010100101000001111010011100
//00111001011110000010100101000000.

// https://leetcode.com/problems/reverse-bits/
//解题思路:从数字bit位的两头对应位置开始判断,如果两个位置bit位值相等则不做处理,如果不等则两个位置都取反
class Problem190Solution1 { //964176192
    func reverseBits(_ n: Int) -> Int {
        var number = n
        for i in 0..<32 {
            let lastIndex = 63 - i
            let bitsFront: Int8 =  n & (0x1 << i) > 0 ? 1 : 0
            let bitsLast: Int8 =  n & (0x1 << lastIndex) > 0 ? 1 : 0
            if bitsFront != bitsLast {
                reverseBit(num: &number, index: i)
                reverseBit(num: &number, index: lastIndex)
            }
        }
        return number
    }
    
    private func reverseBit(num: inout Int, index: Int) {
        return num ^= (1 << index)
    }
    
    private func printBits(num: UInt32) {
        var bitsString = ""
        for i in 0..<32 {
            bitsString += (num & (1 << i) == 0) ? "0" : "1"
        }
        print(String(bitsString.reversed()))
    }
}
