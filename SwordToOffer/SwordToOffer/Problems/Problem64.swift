//
//  Problem64.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/10.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation


/**
 剑指 Offer 64. 求1+2+…+n
 求 1+2+...+n ，要求不能使用乘除法、for、while、if、else、switch、case等关键字及条件判断语句（A?B:C）。
 */

//解决方案1：递归求和法
class Problem64Solution {
    //由于尾递归优化的存在，这样写的递归是安全的
    func sumNums(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }else{
            return sumNums(n - 1) + n
        }
    }
}
