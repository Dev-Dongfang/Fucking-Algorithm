//
//  38_CountandSay.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/10/15.
//  Copyright © 2018 Wei Walden. All rights reserved.
//

import Foundation


class Problem38Solution1 {
    func countAndSay(_ n: Int) -> String {
        var i = 1
        var content: [Character] = ["1"]
        while i < n {
            i += 1
            content = say(contentArray: content)
        }
        return String(content)
    }
    
    private func say(contentArray: [Character]) -> [Character] {
        let contentCount = contentArray.count
        var result: [Character] = [Character]()
        var currentChar: Character = contentArray[0]
        var currentCount = 0
        for i in 0..<contentCount {
            if currentChar != contentArray[i] {
                result += "\(currentCount)\(currentChar)"
                currentCount = 1
                currentChar = contentArray[i]
            }else{
                currentCount += 1
            }
        }
        result += "\(currentCount)\(currentChar)"
        return result
    }
}
