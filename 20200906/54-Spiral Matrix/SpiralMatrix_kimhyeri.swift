//
//  SpiralMatrix.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/09/05.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 54. Spiral Matrix

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var answer = [Int]()

    var m = 0
    var end_m = matrix.count - 1
    var n = 0
    var end_n = matrix.first!.count - 1
    
    while true {
        // 우
        for i in n...end_n {
            answer.append(matrix[m][i])
        }
        m += 1
        if m > end_m {
            break
        }
        
        // 하
        for i in m...end_m {
            answer.append(matrix[i][end_n])
        }
        end_n -= 1
        if n > end_n {
            break
        }
        
        // 좌
        for i in stride(from: end_n, through: n, by: -1) {
            answer.append(matrix[end_m][i])
        }
        end_m -= 1
        if m > end_m {
            break
        }
        
        // 상
        for i in stride(from: end_m, through: m, by: -1) {
            answer.append(matrix[i][n])
        }
        n += 1
        if n > end_n {
            break
        }
    }
    
    return answer
}

print(spiralOrder ([
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]))

//Output: [1,2,3,6,9,8,7,4,5]

print(spiralOrder ([
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [9, 10, 11, 12]
]))
    
//Output: [1,2,3,4,8,12,11,10,9,5,6,7]


