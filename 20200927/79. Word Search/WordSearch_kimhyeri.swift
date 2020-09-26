//
//  WordSearch.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/09/26.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 79. Word Search

struct Position {
     var x: Int, y: Int
 }

 func exist(_ board: [[Character]], _ word: String) -> Bool {
     // 가로 세로 사이즈
     let xSize = board.count, ySize = board[0].count
     let word = Array(word)

     // 비교할 글자수가 더 많을 때
     if xSize * ySize < word.count { return false }

     // 가로 세로 사이즈 1이고, 단어 수 1일 때
     if xSize == 1, ySize == 1, word.count == 1 {
         return board[0][0] == word.first ? true : false
     }

     // 우 상 하 좌 움직일 수 있도록
     let moveX = [1, 0, -1, 0]
     let moveY = [0, 1, 0, -1]

     var visited = Array(repeating: Array(repeating: false, count: ySize),
                             count: xSize)

     // word[count]로 접근하기 위함
     var count = 0

     func dfs(_ position: Position) -> Bool {
         guard count < word.count else { return false }

         // 배열은 여러 수지만 word는 한 단어 일때
         if word.count == 1 {
             return true
         }

         visited[position.x][position.y] = true

         // 1부터 시작해도 된다.
         count = count + 1

         // 상 하 좌 우로 움직이자
         for i in 0...3 {
             let x = position.x + moveX[i]
             let y = position.y + moveY[i]
             if x > -1, y > -1, x < xSize, y < ySize, count < word.count, !visited[x][y] {
                 if board[x][y] == word[count] {
                     if count == word.count - 1 {
                         return true
                     } else {
                         let ans = dfs(Position(x: x, y: y))
                         visited[x][y] = false
                         count = count - 1
                        if ans {
                            return true
                        }
                     }
                 }
             }
         }
        return false
     }
    
     // 시작점
     for i in 0..<xSize {
         for j in 0..<ySize {
             if board[i][j] == word.first {
                if dfs(Position(x: i, y: j)) {
                    return true
                } else {
                    count = 0
                    visited = Array(repeating: Array(repeating: false, count: ySize), count: xSize)
                }
             }
         }
     }
     return false
 }

let test1: [[Character]] = [["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a"],["a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","a","b"]]
print(exist(test1, "baaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"))

let test2: [[Character]] = [["A","B","C","E"],
                        ["S","F","E","S"],
                        ["A","D","E","E"]]

print(exist(test2, "ABCESEEEFS"))
// true

let board: [[Character]] =
[
  ["A","B","C","E"],
  ["S","F","C","S"],
  ["A","D","E","E"]
]

print(exist(board, "ABCCED"))
// true

print(exist(board, "SEE"))
// true

print(exist(board, "ABCB"))
// false

let broad2 : [[Character]] = [["a","a","a"],
                              ["a","b","b"],
                              ["a","b","b"],
                              ["b","b","b"],
                              ["b","b","b"],
                              ["a","a","a"],
                              ["b","b","b"],
                              ["a","b","b"],
                              ["a","a","b"],
                              ["a","b","a"]]
print(exist(broad2, "aabaaaabbb"))
// false
