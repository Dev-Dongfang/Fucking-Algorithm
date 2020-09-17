//
//  17_LetterCombinationsofaPhoneNumber.swift
//  LeetCode
//
//  Created by 韦东方 on 2018/11/9.
//  Copyright © 2018 Wei Walden. All rights reserved.
//

import Foundation



class Problem17Solution1 {
    private var results = [String]()
    private let letterArray: [Character: [Character]] = ["2":["a","b","c"],"3":["d","e","f"],"4":["g","h","i"],"5":["j","k","l"],"6":["m","n","o"],"7":["p","q","r","s"],"8":["t","u","v"],"9":["w","x","y","z"]]
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else { return results }
        
        var currentSequeue = [Character]()
        dfs(inputDigits: Array(digits), currentIndex: 0, currentSequeue: &currentSequeue)
        return results
    }
    
    private func dfs(inputDigits: [Character], currentIndex: Int, currentSequeue: inout [Character]) {
        //当前层级的字母表
        let currentLetters = letterArray[inputDigits[currentIndex]]!
        
        //向下一层遍历
        for letter in currentLetters {
            currentSequeue.append(letter)
            if currentIndex == inputDigits.count - 1 {
                results.append(String(currentSequeue))
                currentSequeue.removeLast()
            }else{
                //继续执行dfs
                dfs(inputDigits: inputDigits, currentIndex: currentIndex + 1, currentSequeue: &currentSequeue)
                //删除元素
                currentSequeue.removeLast()
            }
        }
    }
}
