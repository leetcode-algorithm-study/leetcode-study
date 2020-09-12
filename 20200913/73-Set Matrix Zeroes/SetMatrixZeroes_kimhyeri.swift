//
//  SetMatrixZeroes.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/09/12.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 73. Set Matrix Zeroes

struct Position: Equatable {
    var x: Int
    var y: Int
}

func setZeroes(_ matrix: inout [[Int]]) {
    var checked = [Position]()
    
    for i in 0 ..< matrix.count {
        for j in 0 ..< matrix[i].count {
            if matrix[i][j] == 0 {
                checked.append(Position(x: i,y: j))
            }
        }
    }
    
    for i in 0 ..< matrix.count {
        for j in 0 ..< matrix[i].count {
            if checked.contains(Position(x: i,y: j)) {
                matrix[i] = Array(repeating: 0, count: matrix[i].count) // 가로
                for z in 0..<matrix.count { // 세로
                    matrix[z][j] = 0
                }
            }
        }
    }
}

var matrix = [[1,1,1],[1,0,1],[1,1,1]]
setZeroes(&matrix)
// [[1,0,1],[0,0,0],[1,0,1]]

matrix = [[1,2,3,4],[5,0,7,8],[0,10,11,12],[13,14,15,0]]
setZeroes(&matrix)
//[[0,0,3,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]]

matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
setZeroes(&matrix)
// [[0,0,0,0],[0,4,5,0],[0,3,1,0]]
