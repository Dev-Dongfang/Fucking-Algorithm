//
//  Problem40.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/16.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation


/**
 剑指 Offer 40. 最小的k个数
 输入整数数组 arr ，找出其中最小的 k 个数。例如，输入4、5、1、6、2、7、3、8这8个数字，则最小的4个数字是1、2、3、4。
 */

/**
 解决方案: 利用快排的思想, 查找位于第k个位置的数字, 其前面的即是最小的k个数字.
    基本上来讲,需要写一个快排, 并且, 需要判断执行哪个查找.
 */
class Problem40Solution {
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        if k == 0 { return [] }
        if k >= arr.count { return arr }
        
        var arr = arr
        partition(arr: &arr, l: 0, r: arr.count - 1, k: k)
        return Array(arr.prefix(k))
    }
    
    private func partition(arr: inout [Int], l: Int, r:Int, k: Int) {
        var l1 = l, r1 = r
        let x = arr[l1]
        while l1 < r1 {
            while l1 < r1 && arr[r1] >= x {
                r1 -= 1
            }
            if l1 < r1 {
                arr[l1] = arr[r1]
            }
            while l1 < r1 && arr[l1] <= x {
                l1 += 1
            }
            if l1 < r1 {
                arr[r1] = arr[l1]
            }
        }
        
        arr[l1] = x
        if l1 > k {
            partition(arr: &arr, l: l, r: l1 - 1, k: k)
        }else if l1 < k {
            partition(arr: &arr, l: l1 + 1, r: r, k: k)
        }else{
            return
        }
    }
    
    
}
