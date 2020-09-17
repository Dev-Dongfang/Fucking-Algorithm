//
//  69Sqrt(x).swift
//  LeetCode
//
//  Created by Wei Walden on 2018/9/27.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation

//初步解决方案, 二分查找法
class Problem69Solution1 {
    func mySqrt(_ x: Int) -> Int {
        guard x != 0 else { return 0 }
        return Int(compute(left: 1, right: Double(x / 2), target: Double(x)))
    }
    
    func compute(left: Double, right: Double, target: Double) -> Double {
        if floor(left) >= floor(right) { return floor(left) }
        
        let middle = (right - left) / 2 + left
        
        if middle * middle > target {
            return compute(left: left, right: middle, target: target)
        }else{
            return compute(left: middle, right: right, target: target)
        }
    }
}




