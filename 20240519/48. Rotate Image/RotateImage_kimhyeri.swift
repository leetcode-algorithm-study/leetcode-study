class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        for i in 0..<matrix.count / 2 {
            for j in i..<matrix.count - i - 1 {
                print("i \(i) j \(j)")
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
}

// default
// 00 01 02 // 1 2 3
// 10 11 12 // 4 5 6 
// 20 21 22 // 7 8 9

// i = 0 j = 0
// 20 01 00 // 7 2 1
// 10 11 12 // 4 5 6
// 22 21 02 // 9 8 3

// i = 0 j = 1
// 20 10 00 // 7 4 1
// 21 11 01 // 8 5 2
// 22 12 02 // 9 6 3
