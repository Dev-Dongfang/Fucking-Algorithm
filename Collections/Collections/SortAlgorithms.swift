//
//  SortAlgorithms.swift
//  BasicAlgorithmSets
//
//  Created by 韦东方 on 2020/3/22.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation



/// 排序相关算法
class SortAlgorithms {}


// 经典排序算法
extension SortAlgorithms {
    ///冒泡排序 O(n^2)
    /*
    依次比较两个相邻的元素，如果顺序（如从大到小、首字母从Z到A）错误就把他们交换过来。
     走访元素的工作是重复地进行直到没有相邻元素需要交换，也就是说该元素列已经排序完成。
     */
    func bubbleSort(nums: [Int]) -> [Int] {
        guard nums.isEmpty == false else { return nums }
        var nums = nums
        for i in 0..<nums.count {
            let tail = nums.count - i - 1
            for j in 0..<tail {
                if nums[j] > nums[j + 1] {
                    nums.swapAt(j, j + 1)
                }
            }
        }
        return nums
    }
    
    
    
    ///选择排序 O(n^2)
    /** 第一次从待排序的数据元素中选出最小（或最大）的一个元素，存放在序列的起始位置，然后再从剩余的未排序元素中寻找到最小（大）元素，然后放到已排序的序列的末尾。以此类推，直到全部待排序的数据元素的个数为零。选择排序是不稳定的排序方法。*/
    func selectionSort(nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        var nums = nums
        for i in 0..<nums.count {
            var minIndex = i
            for j in (i + 1)..<nums.count {
                if nums[minIndex] > nums[j] {
                    minIndex = j
                }
            }
            if minIndex != i {
                nums.swapAt(minIndex, i)
            }
        }
        return nums
    }
    
    
    
    
    /// 插入排序 O(n^2)
    /*插入算法把要排序的数组分成两部分：第一部分包含了这个数组的所有元素，但将最后一个元素除外（让数组多一个空间才有插入的位置），而第二部分就只包含这一个元素（即待插入元素）。在第一部分排序完成后，再将这个最后元素插入到已排好序的第一部分中。
     */
    func  insertionSort(nums: [Int]) -> [Int] {
        guard  nums.count > 1 else { return nums }
        var nums = nums
        for i in 1..<nums.count {
            let tmp = nums[i]
            var j = i
            while j - 1 >= 0 && nums[j - 1] > tmp {
                nums.swapAt(j, j - 1)
                j -= 1
            }
            if j != i {
                nums[j] = tmp
            }
        }
        return nums
    }
    
    
    
    
    /// 快速排序 O(n log n)
    /*
     通过一趟排序将要排序的数据分割成独立的两部分，其中一部分的所有数据都比另外一部分的所有数据都要小，然后再按此方法对这两部分数据分别进行快速排序，整个排序过程可以递归进行，以此达到整个数据变成有序序列。
     */
    func quickSort(nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        
        var nums = nums
        quickSort(nums: &nums, low: 0, high: nums.count - 1)
        return nums
    }
    private func quickSort(nums: inout [Int], low: Int, high: Int) {
        guard low < high else { return }
        var l = low, h = high
        let value = nums[l]
        while l < h {
            while l < h && nums[h] >= value { h -= 1 }
            nums[l] = nums[h]
            while l < h && nums[l] <= value { l += 1 }
            nums[h] = nums[l]
        }
        nums[l] = value
        quickSort(nums: &nums, low: low, high: l - 1)
        quickSort(nums: &nums, low: l + 1, high: high)
    }
    
    
    
    
    /// 归并排序 O(n log n)
    /**
 归并排序（MERGE-SORT）是建立在归并操作上的一种有效的排序算法,该算法是采用分治法（Divide and Conquer）的一个非常典型的应用。将已有序的子序列合并，得到完全有序的序列；即先使每个子序列有序，再使子序列段间有序。若将两个有序表合并成一个有序表，称为二路归并。归并排序是一种稳定的排序方法。
     */
    func mergeSort<T: Comparable>(nums: [T]) -> [T] {
        return mergeSort(nums: nums, low: 0, height: nums.count - 1)
    }
    func mergeSort<T: Comparable>(nums: [T], low: Int, height: Int) -> [T] {
        if low == height {
            return [nums[low]]
        }
        let mid = low + (height - low) / 2
        let leftArray = mergeSort(nums: nums, low: low, height: mid)
        let rightArray = mergeSort(nums: nums, low: mid + 1, height: height)
        var newArray = [T]()
        
        var i = 0, j = 0
        while i < leftArray.count && j < rightArray.count {
            if leftArray[i] <= rightArray[j] {
                newArray.append(leftArray[i])
                i += 1
            }else{
                newArray.append(rightArray[j])
                j += 1
            }
        }
        
        while i < leftArray.count {
            newArray.append(leftArray[i])
            i += 1
        }
        while j < rightArray.count {
            newArray.append(rightArray[j])
            j += 1
        }
        return newArray
    }
}





