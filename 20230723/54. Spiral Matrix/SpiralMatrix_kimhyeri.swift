class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let row = matrix.count
        let col = matrix[0].count
        var res = [Int]()

        var left = 0
        var right = col - 1
        var up = 0
        var bottom = row - 1

        while left <= right && up <= bottom {
            // right
            for col in left...right {
                res.append(matrix[up][col])
            }
            up += 1
            if up > bottom {break}

            // down
            for row in up...bottom {
                res.append(matrix[row][right])
            }
            right -= 1
            if left > right {break}

            // left
            for col in (left...right).reversed() {
                res.append(matrix[bottom][col])
            }
            bottom -= 1
            if up > bottom {break}

            // up
            for row in (up...bottom).reversed() {
                res.append(matrix[row][left])
            }
            left += 1
            if left > right {break}
        }
        return res
    }
}

// 00 01 02
// 10 11 12
// 20 21 22
