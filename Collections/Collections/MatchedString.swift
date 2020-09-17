//
//  SearchInString.swift
//  BasicAlgorithmSets
//
//  Created by 韦东方 on 2020/4/1.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation
// 五花八门的字符串搜索算法


class SearchInString { }


/// 1.BF算法，暴力破解算法，从头到尾以此匹配
extension SearchInString {
    func bruteForce(str: String, pattern: String) -> Int? {
        let strChars = Array<Character>(str)
        let patternChars = Array<Character>(pattern)
        for i in 0...(strChars.count - patternChars.count) {
            var currentIndex = 0
            while currentIndex < patternChars.count && strChars[currentIndex + i] == patternChars[currentIndex] {
                currentIndex += 1
            }
            if currentIndex >= patternChars.count {
                return i
            }
        }
        return nil
    }
}





/// 2.RK(Rabin-Karp)算法，基于哈希匹配的算法
extension SearchInString {
    
    private static var dict: [Character: Int] = {
        //构建缓存字典
        let primes = outputPrime(n: 62)
        let alphas = Array<Character>("abcdefghijklmnopqrstuvwxyzABCDEFGHIGKLMNOPQRSTUVWXYZ1234567890")
        var dict = [Character: Int]()
        for (index,prime) in primes.enumerated() {
            dict[alphas[index]] = prime
        }
        return dict
    }()

    //RK算法
    func rabinKarp(str: String, pattern: String) -> Int? {
        let pattern = Array<Character>(pattern)
        let str = Array<Character>(str)
        //1.计算模式串哈希值
        let hashPattern = pattern.reduce(0) {$0 + SearchInString.dict[$1]!}
        //2.计算主串前n个字符的哈希值
        var hashCurrent = str.prefix(pattern.count).reduce(0) {$0 + SearchInString.dict[$1]!}
        //3.依次向后移动并计算哈希值并比较
        for index in 0...(str.count - pattern.count) {
            if index != 0 {
                hashCurrent -= SearchInString.dict[str[index - 1]]!
                hashCurrent += SearchInString.dict[str[index + pattern.count - 1]]!
            }
            if hashCurrent == hashPattern && checkMatching(str: str, index: index, pattern: pattern) {
                return index
            }
        }
        return nil
    }
    
    //防止哈希冲突返回错误的结果，当遇到两个hash值相同的字符串时候，使用bf算法验证一下
    private func checkMatching(str: [Character], index: Int, pattern: [Character]) -> Bool {
        for (i, char) in pattern.enumerated() {
            if str[i + index] != char {
                return false
            }
        }
        return true
    }

    //输出前n个素数
    private static func outputPrime(n: Int) -> [Int] {
        var primes = [2]
        var currentNumber = 3
        while primes.count < n {
            if isPrime(num: currentNumber) {
                primes.append(currentNumber)
            }
            currentNumber += 2
        }
        return primes
    }
    
    // 判断是否是素数
    private static func isPrime(num: Int) -> Bool {
        guard num > 3 else { return num > 1 }
        var i = 2
        while i * i < num {
            if num % i == 0 {
                return false
            }
            i += 1
        }
        return true
    }
}





/// 3.BM（Boyer-Moore）算法，基于坏字符和好后缀
extension SearchInString {
    //BM算法主体
    //算法思想：模式串和主串从后向前匹配，找到第一个不匹配的位置，使用好后缀或者坏字符算法计算位移距离，尽可能的向后位移
    func boyerMoore(str: String, pattern: String) -> Int? {
        let str = Array<Character>(str)
        let pattern = Array<Character>(pattern)
        let patternCharLocations = generateCharsDict(pattern: pattern)
        let mainStrAssist = generateGoodSuffixAssist(pattern: str)
        
        var i = 0   //表示模式串和主串对齐的第一个字符位置
        while i <= str.count - pattern.count {
            //从后向前匹配，找到坏字符位置
            var j = pattern.count - 1
            //如果模式串和主串对应位置匹配，则一直向前继续匹配
            while j >= 0 && pattern[j] == str[j + i] {
                j -= 1
            }
            //当j<0时候，说明主串和模式串完全匹配，找到了第一个匹配的位置i
            if j < 0 {
                return i
            }
            //根据坏字符规则更新模式串和主串对齐的起始位置
            let badCharacterMoveLength = (j - (patternCharLocations[str[j + i]] ?? -1))
            var goodSuffixLength = 0
            if j < pattern.count - 1{
                goodSuffixLength = goodSuffixMoveLength(index: j, length: pattern.count, suffix: mainStrAssist.suffix, prefix: mainStrAssist.prefix)
            }
            i = i + max(badCharacterMoveLength, goodSuffixLength)
        }
        
        return nil
    }
    
    //生成模式串每个字符对应的位置,用于坏字符规则查找坏字符在模式串中位置
    private func generateCharsDict(pattern: [Character]) -> [Character: Int] {
        var dict = [Character: Int]()
        for index in 0..<pattern.count {
            dict[pattern[index]] = index
        }
        return dict
    }
    
    //生成好后缀规则字符串位置
    private func goodSuffixMoveLength(index: Int, length: Int, suffix: [Int], prefix:[Bool]) -> Int {
        let k = length - 1 - index
        if suffix[k] != -1 {
            return index - suffix[k] + 1
        }
        for r in (index + 2)..<(length - 1) {
            if prefix[length - r] == true {
                return r
            }
        }
        return length
    }
    
    //生成好后缀规则辅助数组
    private func generateGoodSuffixAssist(pattern: [Character]) -> (suffix: [Int], prefix:[Bool]) {
        let count = pattern.count
        var suffix = Array<Int>.init(repeating: -1, count: count)
        var prefix = Array<Bool>(repeating: false, count: count)
        for i in 0..<(count - 1) {
            var j = i
            var k = 0
            while j >= 0 && pattern[j] == pattern[count - 1 - k] {
                j -= 1
                k += 1
                suffix[k] = j + 1
            }
            if j == -1 {
                prefix[k].toggle()
            }
        }
        return (suffix, prefix)
    }
}






//4.KMP
extension SearchInString {

    // a, b分别是主串和模式串；n, m分别是主串和模式串的长度。
    func kmp(str: String, pattern: String) -> Int? {
        let a = Array<Character>(str)
        let b = Array<Character>(pattern)
        let n = a.count
        let m = b.count
        let next = getNexts(pattern: b)
        var j = 0;
        for i in 0..<n {
            while j > 0 && a[i] != b[j] { // 一直找到a[i]和b[j]
                j = next[j - 1] + 1;
            }
            if (a[i] == b[j]) {
                j += 1
            }
            if (j == m) { // 找到匹配模式串的了
              return i - m + 1;
            }
        }
        return nil
    }
    

    // b表示模式串，m表示模式串的长度
    private func getNexts(pattern: [Character]) -> [Int] {
        // b表示模式串，m表示模式串的长度
        let b = Array<Character>(pattern)
        let m = b.count
        var next = [Int](repeating: -1, count: m)
        var k = -1
        for i in 1..<m {
            while k != -1 && b[k + 1] != b[i] {
                k = next[k]
            }
            if b[k + 1] == b[i] {
                k += 1
            }
            next[i] = k
        }
        return next
    }
}
