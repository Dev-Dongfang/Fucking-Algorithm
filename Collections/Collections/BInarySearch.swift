//
//  SearchAlgorithms.swift
//  BasicAlgorithmSets
//
//  Created by 韦东方 on 2020/3/22.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation



/// 查找查找相关的算法
class SearchAlgorithms {}

/// 二分查找
/// 二分查找也称折半查找（Binary Search），它是一种效率较高的查找方法。但是，折半查找要求线性表必须采用顺序存储结构，而且表中元素按关键字有序排列。
extension SearchAlgorithms {
    ///常规的二分查找算法, 要求查找的目标数据在排序数组中只出现一次
    func binarySearch(nums: [Int], value: Int) -> Int? {
        var  l = 0, h = nums.count - 1
        while l <= h {
            let mid = l + (h - l) >> 1
            if nums[mid] == value {
                return mid
            }else if nums[mid] > value{
                h = mid - 1
            }else{
                l = mid + 1
            }
        }
        return nil
    }
    
    ///查找第一个等于给定值的index,目标可以在数组中出现多次
    func binarySearchFirstIndex(nums: [Int], value: Int) -> Int? {
        var l = 0, h = nums.count - 1
        while l <= h {
            let mid = l + (h - l) / 2
            if nums[mid] > value {
                h = mid - 1
            }else if nums[mid] < value{
                l = mid + 1
            }else {
                if mid == 0 || nums[mid - 1] != value {
                    return mid
                }else{
                    h = mid - 1
                }
            }
        }
        return nil
    }
    
    ///查找最后一个等于给定值的index, 目标可以在数组中出现多次
    func binarySearchLastIndex(nums: [Int], value: Int) -> Int? {
        var l = 0, h = nums.count - 1
        while l <= h {
            let mid = l + (h - l) / 2
            if nums[mid] > value {
                h = mid - 1
            }else if nums[mid] < value {
                l = mid + 1
            }else{
                if mid == nums.count - 1 || nums[mid + 1] != value {
                    return mid
                }else{
                    l = mid + 1
                }
            }
        }
        return nil
    }
    
    /// 查找第一个小于给定值的元素位置
    func binarySearchFirstLessThanIndex(nums: [Int], value: Int) -> Int? {
        var l = 0, h = nums.count - 1
        while l <= h {
            let mid = l + (h - l) >> 2
            if(nums[mid] < value){
                if mid == nums.count - 1 || nums[mid + 1] >= value {
                    return mid
                }else{
                    l = mid + 1;
                }
            }else{
                h = mid - 1;
            }
        }
        return nil
    }
    
    /// 查找第一个大于给定值 的元素位置
    func binarySearchFirstMoreThanIndex(nums: [Int], value: Int) -> Int? {
        var l = 0, h = nums.count - 1
        while l <= h {
            let mid = l + (h - l) / 2
            if(nums[mid] > value){
                if mid == 0 || nums[mid - 1] <= value {
                    return mid
                }else{
                    h = mid - 1;
                }
            }else{
                l = mid + 1;
            }
        }
        return nil
    }
    
    /// 查找最后一个小于等于给定值的元素位置
    func binarySearchFirstLessThanOrEquelIndex(nums: [Int], value: Int) -> Int? {
        var l = 0, h = nums.count - 1
        while l <= h {
            let mid = l + (h - l) >> 2
            if nums[mid] <= value {
                if mid == nums.count - 1 || nums[mid + 1] > value {
                    return mid
                }else{
                    l = mid + 1
                }
            }else{
                h = mid - 1
            }
        }
        return nil
    }
    
    
    /// 查找第一个大于等于给定值的元素位置
    func binarySearchFirstMoreThanOrEquelIndex(nums: [Int], value: Int) -> Int? {
        var l = 0, h = nums.count - 1
        while l <= h {
            let mid = l + (h - l) >> 2
            if nums[mid] >= value {
                if mid == 0 || nums[mid - 1] < value {
                    return mid
                }else{
                    h = mid - 1
                }
            }else{
                l = mid + 1
            }
        }
        return nil
    }
}
