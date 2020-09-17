//
//  13_Roman_ToInteger.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/9/27.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation


class Problem13Solution1 {
    //解决方案,按照每位相加,减去多加的数字
    func romanToInt(_ s: String) -> Int {
        var sum: Int = 0
        var romans: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        s.forEach {sum += romans[$0]!}
        
        if s.contains("IV") { sum -= 2 }
        if s.contains("IX") { sum -= 2 }
        if s.contains("XL") { sum -= 20 }
        if s.contains("XC") { sum -= 20 }
        if s.contains("CD") { sum -= 200 }
        if s.contains("CM") { sum -= 200 }
        return sum
    }
}


