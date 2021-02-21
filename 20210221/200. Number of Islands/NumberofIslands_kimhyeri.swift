//
//  NumberofIslands.swift
//  LeetCode
//
//  Created by 김혜리 on 2021/02/21.
//  Copyright © 2021 hyerikim. All rights reserved.
//

import Foundation

/// 200. Number of Islands

let xArr = [1,0,-1,0]
let yArr = [0,1,0,-1]

func numIslands(_ grid: [[Character]]) -> Int {
    var answer = 0
    var copy = grid
    var visited = Array(repeating: Array(repeating: false, count: grid.first!.count), count: grid.count)
    
    func dfs(grid: inout [[Character]], x: Int, y: Int) {
        visited[x][y] = true

        for i in 0..<4 {
            let myX = x + xArr[i]
            let myY = y + yArr[i]
            
            if myX >= 0 , myY >= 0, myX < grid.count, myY < grid.first!.count {
                if grid[myX][myY] == "1", visited[myX][myY] == false {
                    visited[myX][myY] = true
                    dfs(grid: &grid,x: myX,y: myY)
                }
            }
        }
    }
    
    for x in 0..<grid.count {
        for y in 0..<grid.first!.count {
            if copy[x][y] == "1", visited[x][y] == false {
                answer = answer + 1
                dfs(grid: &copy, x: x, y: y)
            }
        }
    }
    
    return answer
}

let grid1: [[Character]] = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]

print(numIslands(grid1))

let grid2: [[Character]] = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]

print(numIslands(grid2))
