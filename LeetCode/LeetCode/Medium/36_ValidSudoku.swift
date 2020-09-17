//
//  36_ValidSudoku.swift
//  LeetCode
//
//  Created by Wei Walden on 2018/10/11.
//  Copyright © 2018年 Wei Walden. All rights reserved.
//

import Foundation




/// 校验数独是否有重复的数字
// 解决方案:1.循环1~9,每次使用分别验证一行,一列一个九宫格是否有重复的数字,如果有则失败,如果没有最终返回成功.
//  这应该是一种暴力的解决方案吧...   200ms, 这运行速率我是不满意的
class Problem36Solution1 {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
        var xSet = Set<Character>()
        var ySet = Set<Character>()
        var cellSet = Set<Character>()
        for i in 0..<9 {
            let cellX = i % 3
            let cellY = i / 3
            xSet.removeAll()
            ySet.removeAll()
            cellSet.removeAll()
            for j in 0..<9 {
                //检验列
                if board[i][j] != "." && ySet.contains(board[i][j]) {
                    return false
                }else{
                    ySet.insert(board[i][j])
                }
                //检验行
                if board[j][i] != "." && xSet.contains(board[j][i]) {
                    return false
                }else{
                    xSet.insert(board[j][i])
                }
                //检验九宫格
                let cellContent = board[cellX * 3 + j % 3][cellY * 3 + j / 3]
                if cellContent != "." && cellSet.contains(cellContent) {
                    return false
                }else{
                    cellSet.insert(cellContent)
                }
            }
        }
        
        return true
    }
}



class Problem36Solution2 {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
        var xSet = Set<Character>()
        var ySet = Set<Character>()
        var cellSet = Set<Character>()
        for i in 0..<9 {
            let cellX = i % 3
            let cellY = i / 3
            xSet.removeAll()
            ySet.removeAll()
            cellSet.removeAll()
            for j in 0..<9 {
                //检验列
                if board[i][j] != "." && ySet.contains(board[i][j]) {
                    return false
                }else{
                    ySet.insert(board[i][j])
                }
                //检验行
                if board[j][i] != "." && xSet.contains(board[j][i]) {
                    return false
                }else{
                    xSet.insert(board[j][i])
                }
                //检验九宫格
                let cellContent = board[cellX * 3 + j % 3][cellY * 3 + j / 3]
                if cellContent != "." && cellSet.contains(cellContent) {
                    return false
                }else{
                    cellSet.insert(cellContent)
                }
            }
        }
        
        return true
    }
}
