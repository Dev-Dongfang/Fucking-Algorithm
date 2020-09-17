//
//  Problem12.swift
//  SwordToOffer
//
//  Created by 韦东方 on 2020/9/14.
//  Copyright © 2020 Walden. All rights reserved.
//

import Foundation

/**
 剑指 Offer 12. 矩阵中的路径
 请设计一个函数，用来判断在一个矩阵中是否存在一条包含某字符串所有字符的路径。路径可以从矩阵中的任意一格开始，每一步可以在矩阵中向左、右、上、下移动一格。如果一条路径经过了矩阵的某一格，那么该路径不能再次进入该格子。例如，在下面的3×4的矩阵中包含一条字符串“bfce”的路径（路径中的字母用加粗标出）。

 [["a","b","c","e"],
 ["s","f","c","s"],
 ["a","d","e","e"]]

 但矩阵中不包含字符串“abfb”的路径，因为字符串的第一个字符b占据了矩阵中的第一行第二个格子之后，路径不能再次进入这个格子。
 */


/**
 解决方案：
    回溯法+遍历。
 */



class Problem12 {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let words = Array(word)
        guard words.count > 0 else { return false }
        var board = board
        for (y,row) in board.enumerated() {
            for (x,_) in row.enumerated() {
                if dfs(board: &board, words: words, index: 0, y: y, x: x) {
                    return true
                }
            }
        }
        return false
        
    }
    
    private func dfs(board: inout [[Character]], words: [Character], index: Int, y: Int, x: Int) -> Bool {
        if index >= words.count {
            return true
        }
        if x < 0 || x >= board[0].count || y < 0 || y >= board.count {
            return false
        }
        
        var res: Bool = false
        if board[y][x].asciiValue == words[index].asciiValue! {
            let tmp = board[y][x]
            board[y][x] = "/"
            res = dfs(board: &board, words: words, index: index + 1, y: y, x: x + 1)
                || dfs(board: &board, words: words, index: index + 1, y: y, x: x - 1)
                || dfs(board: &board, words: words, index: index + 1, y: y + 1, x: x)
                || dfs(board: &board, words: words, index: index + 1, y: y - 1, x: x)
            board[y][x] = tmp
        }
        return res
    }
}
