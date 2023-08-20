class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {

        var cIndex = [Int]()
        var rIndex = [Int]()

        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[i].count {
                if matrix[i][j] == 0 {
                    rIndex.append(i)
                    cIndex.append(j)
                }
            }
        }

        for i in cIndex {
            for j in 0 ..< matrix.count {
                // row 값을 증가시키면서 한 colum을 다 0으로 바꾸는 작업
                matrix[j][i] = 0
            }
        }

        print(matrix)

        for i in rIndex {
            for j in 0 ..< matrix[i].count {
                // column 값을 증가시키면서 한 colum을 다 0으로 바꾸는 작업
                matrix[i][j] = 0
            }
        }

        print(matrix)

    }
}

// 00 01 02
// 10 11 12
// 20 21 22
