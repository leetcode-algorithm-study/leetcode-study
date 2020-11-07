//
//  SurroundedRegions.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/11/07.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 130. Surrounded Regions

let four = [(1,0), (-1,0), (0,1), (0,-1)]

func solve(_ board: inout [[Character]]) {
    for row in 0..<board.count {
        for col in 0..<board[row].count {
            if board[row][col] == "O" {
                var current = board
                if isValidClearedRegionBoardDFS(&current, row, col) {
                    board = current
                }
            }
        }
    }
}

func isValidClearedRegionBoardDFS(_ grid: inout [[Character]], _ row: Int, _ col: Int) -> Bool {
    if row < 0 || row >= grid.count || col < 0 || col >= grid[row].count {
        return false
    }
    
    if grid[row][col] != "O" {
        return true
    }
    
    grid[row][col] = "X"
    
    for (dx, dy) in four {
        let newRow = row + dx
        let newCol = col + dy
        let isValid = isValidClearedRegionBoardDFS(&grid, newRow, newCol)
        if !isValid {
            return false
        }
    }
    return true
}
