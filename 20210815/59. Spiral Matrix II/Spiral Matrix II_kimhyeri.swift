class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var matrix = Array(repeating: Array(repeating: n * n, count: n), count: n)
        var num = 1
        var top = 0
        var right = n - 1
        var bottom = n - 1
        var left = 0

        while top < bottom && left < right {

            for i in stride(from: left, to: right, by: 1) {
                matrix[top][i] = num
                num += 1
            }
            print(matrix)

            for i in stride(from: top, to: bottom, by: 1) {
                matrix[i][right] = num
                num += 1
            }
            print(matrix)

            for i in stride(from: right, to: left, by: -1) {
                matrix[bottom][i] = num
                num += 1
            }
            print(matrix)

            for i in stride(from: bottom, to: top, by: -1) {
                matrix[i][left] = num
                num += 1
            }
            print(matrix)

            top += 1
            right -= 1
            bottom -= 1
            left += 1

        }

        return matrix
    }
}

