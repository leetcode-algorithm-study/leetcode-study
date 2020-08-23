//
//  ValidSudoku.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/08/19.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 36. Valid Sudoku

// x,y좌표 구조체
struct Position {
    var x: Int
    var y: Int
}

// Swift에서는 Queue를 따로 생성해줘야함
struct Queue {
    private var queue = [Position]()
    
    mutating func dequeue() -> Position? {
        return queue.removeFirst()
    }
    
    mutating func enqueue(element: Position) {
        queue.append(element)
    }
    
    func isEmpty() -> Bool {
        return queue.isEmpty
    }
}

func isValidSudoku(_ board: [[Character]]) -> Bool {
    var answer = true
    var dictionary = [Character: Int]()
    
    // 현재 포함되어 있는지
    func validCheck(x: Int, y: Int) {
        guard x < 9 || y < 9, board[x][y] != "."  else { return }
        let value = board[x][y]
        if let _ = dictionary[value] {
            answer = false
            return
        } else {
            dictionary.updateValue(1, forKey: value)
        }
    }
    
    // 가로 세로 일자로 쭉 검사
    for i in 0...8 {
        for j in 0...8 {
            validCheck(x: i, y: j)
        }
        if !answer { return answer }
        dictionary.removeAll()
        
        for j in 0...8 {
            validCheck(x: j, y: i)
        }
        if !answer { return answer }
        dictionary.removeAll()
    }
    
    // 해당 포지션에 대해서 BFS진행
    let search = [Position(x: 0, y: 0),
                  Position(x: 0, y: 3),
                  Position(x: 0, y: 6),
                  Position(x: 3, y: 0),
                  Position(x: 3, y: 3),
                  Position(x: 3, y: 6),
                  Position(x: 6, y: 0),
                  Position(x: 6, y: 3),
                  Position(x: 6, y: 6)]
    
    let dx = [0,0,-1,1]
    let dy = [1,-1,0,0]
    
    var visited = Array(repeating: Array(repeating: false, count: 9), count: 9)
    
    for i in search {
        var queue = Queue()
        queue.enqueue(element: Position(x: i.x, y: i.y))
        validCheck(x: i.x, y: i.y)
        visited[i.x][i.y] = true
        
        while !queue.isEmpty() {
            let my = queue.dequeue()
            for j in 0..<4 {
                let myX = (my?.x)! + dx[j]
                let myY = (my?.y)! + dy[j]
                if myX >= 0 && myY >= 0 && myX < i.x + 3 && myY < i.y + 3 {
                    if visited[myX][myY] == false {
                        validCheck(x: myX, y: myY)
                        queue.enqueue(element: Position(x: myX, y: myY))
                        visited[myX][myY] = true
                    }
                }
            }
        }
        dictionary.removeAll()
    }
    
    return answer
}
print(isValidSudoku([["5","3",".",".","7",".",".",".","."],
                     ["6",".",".","1","9","5",".",".","."],
                     [".","9","8",".",".",".",".","6","."],
                     ["8",".",".",".","6",".",".",".","3"],
                     ["4",".",".","8",".","3",".",".","1"],
                     ["7",".",".",".","2",".",".",".","6"],
                     [".","6",".",".",".",".","2","8","."],
                     [".",".",".","4","1","9",".",".","5"],
                     [".",".",".",".","8",".",".","7","9"]]
    )
)
// true

print(isValidSudoku([["8","3",".",".","7",".",".",".","."],
                     ["6",".",".","1","9","5",".",".","."],
                     [".","9","8",".",".",".",".","6","."],
                     ["8",".",".",".","6",".",".",".","3"],
                     ["4",".",".","8",".","3",".",".","1"],
                     ["7",".",".",".","2",".",".",".","6"],
                     [".","6",".",".",".",".","2","8","."],
                     [".",".",".","4","1","9",".",".","5"],
                     [".",".",".",".","8",".",".","7","9"]]
    )
)

// false

print(isValidSudoku([[".",".",".",".","5",".",".","1","."],
                     [".","4",".","3",".",".",".",".","."],
                     [".",".",".",".",".","3",".",".","1"],
                     ["8",".",".",".",".",".",".","2","."],
                     [".",".","2",".","7",".",".",".","."],
                     [".","1","5",".",".",".",".",".","."],
                     [".",".",".",".",".","2",".",".","."],
                     [".","2",".","9",".",".",".",".","."],
                     [".",".","4",".",".",".",".",".","."]]
    )
)

// false

// Result
// Runtime: 324 ms, faster than 5.10% of Swift online submissions for Valid Sudoku.
// Memory Usage: 20.8 MB, less than 90.31% of Swift online submissions for Valid Sudoku.
