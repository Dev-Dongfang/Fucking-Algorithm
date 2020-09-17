//
//  main.swift
//  BasicAlgorithmSets
//
//  Created by 韦东方 on 2020/3/22.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation



//排序算法
do {
    print("Test Sort Algorithms")
    let unsortNumbers = [5,2,1,87,34,25,76,33,66,22,77,6,66,6,8,65]
    let sortAlgorithm = SortAlgorithms()
    print(sortAlgorithm.bubbleSort(nums: unsortNumbers))
    print(sortAlgorithm.insertionSort(nums: unsortNumbers))
    print(sortAlgorithm.selectionSort(nums: unsortNumbers))
    print(sortAlgorithm.quickSort(nums: unsortNumbers))
    print(sortAlgorithm.mergeSort(nums: unsortNumbers))
}



//查找算法
do {
    print("Search Algorithm")
    let nums = [1, 2, 5, 6, 6, 8, 22, 25, 33, 34, 65, 66, 66, 66, 76, 77, 87]
    let searchAlgo = SearchAlgorithms()
    print(searchAlgo.binarySearch(nums: nums, value: 77) ?? Int.min)
    print(searchAlgo.binarySearch(nums: nums, value: 66) ?? Int.min)
    print(searchAlgo.binarySearchFirstIndex(nums: nums, value: 66) ?? Int.min) //11
    print(searchAlgo.binarySearchLastIndex(nums: nums, value: 66) ?? Int.min) //13
    print(searchAlgo.binarySearchFirstLessThanIndex(nums: nums, value: 100) ?? Int.min) //10
    print(searchAlgo.binarySearchFirstMoreThanIndex(nums: nums, value: -10) ?? Int.min) //14
    print(searchAlgo.binarySearchFirstLessThanOrEquelIndex(nums: nums, value:66) ?? Int.min) //14
    print(searchAlgo.binarySearchFirstMoreThanOrEquelIndex(nums: nums, value:66) ?? Int.min)
}


//字符串匹配系列算法
do{
    print("Search In String")
    let str = "rq3ry7tqiu3874trhaeakerrr7rq3rfusdjf3874thakei74q3rjsdfaki7rq3ry7tqiuhquakei7tq3rwr8qFDasurWRQADak3rFWQAF"
    let pattern = "7tqiu3874trhaeakerrr7r"    //39
    let search = SearchInString()
    print(search.bruteForce(str: str, pattern: pattern))
    print(search.rabinKarp(str: str, pattern: pattern))
    print(search.boyerMoore(str: str, pattern: pattern))
    print(search.kmp(str: str, pattern: pattern))
}


do{
    print("\n\nSearch Palindrome")
    let data = "abababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababa"
    let palindrome = LongestPalindromicSubstring()
//    print(palindrome.longestPalindrome(data))
    print(palindrome.longestPalindrome_expendFromCenter(data))
}




//2020-03-23 01:07:23, 练习算法题目
//AlgorithmPractice1.test()
//AlgorithmPractice2.test()
