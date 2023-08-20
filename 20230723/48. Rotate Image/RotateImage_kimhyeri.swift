class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let rows = matrix.count
        let columns = rows

        for row in 0..<rows {
            for column in row..<columns {
                let temp = matrix[row][column]
                matrix[row][column] = matrix[column][row]
                matrix[column][row] = temp
            }
        }

        for row in 0..<rows {
            matrix[row].reverse()
        }
    }
}

// 00 01 02
// 10 11 12
// 20 21 22

// 원하는 것
// 00 > 02
// 01 > 12
// 02 > 22

// 2스텝
// 00 > 00 > 02
// 01 > 10 > 12
// 02 > 20 > 22

// 증가하는 것
// rowIndex가 0...2 

// 00 > 00
// 01 > 10
// 02 > 20

// 1 2 3
// 4 5 6
// 7 8 9

// 1 4 7
// 2 5 8
// 3 6 9

// 7 4 1
// 8 5 2
// 9 6 3
