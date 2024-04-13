class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var rows: Set<Int> = []
        var cols: Set<Int> = []

        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[i].count {
                if matrix[i][j] == 0 {
                    rows.insert(i)
                    cols.insert(j)
                }
            }
        }

        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[i].count {
                if rows.contains(i) || cols.contains(j) {
                    matrix[i][j] = 0
                }
            }
        }
    }
}