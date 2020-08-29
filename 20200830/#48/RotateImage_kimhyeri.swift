//
//  RotateImage.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/08/28.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 48. Rotate Image
func rotate(_ matrix: inout [[Int]]) {
    for i in 0..<matrix.count / 2 {
        // 깊이가 몇번 째 줄인지
        for j in i..<matrix.count - i - 1 {
            // 네모난 것
            (matrix[i][j],
             matrix[j][matrix.count - 1 - i],
             matrix[matrix.count - 1 - i][matrix.count - 1 - j],
             matrix[matrix.count - 1 - j][i]) = (matrix[matrix.count - 1 - j][i],
                                                 matrix[i][j],
                                                 matrix[j][matrix.count - 1 - i],
                                                 matrix[matrix.count - 1 - i][matrix.count - 1 - j]
            )
        }
    }
}
//[
//  [7,4,1],
//  [8,5,2],
//  [9,6,3]
//]
var array = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]

print(rotate(&array))
print(array)

// Result
// Runtime: 8 ms, faster than 100.00% of Swift online submissions for Rotate Image.
// Memory Usage: 20.6 MB, less than 82.87% of Swift online submissions for Rotate Image.
