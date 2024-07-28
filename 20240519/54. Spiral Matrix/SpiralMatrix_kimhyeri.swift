class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var row = matrix.count
        var col = matrix[0].count
        var res = [Int]()

        var left = 0
        var right = col - 1
        var up = 0
        var bottom = row - 1

        while left <= right && up <= bottom {
            for col in left...right {
                res.append(matrix[up][col])
            }
            up += 1
            if up > bottom {break}

            for row in up...bottom {
                res.append(matrix[row][right])
            }
            right -= 1
            if left > right {break}

            for col in (left...right).reversed() {
                res.append(matrix[bottom][col])
            }
            bottom -= 1
            if up > bottom {break}

            for row in (up...bottom).reversed() {
                res.append(matrix[row][left])
            }
            left += 1
            if left > right {break}
        }
        return res
    }
}