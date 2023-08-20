class Solution {
    fun spiralOrder(matrix: Array<IntArray>): List<Int> {
        val ret = mutableListOf<Int>()

        var colEnd = matrix[0].size - 1
        var rowEnd = matrix.size - 1
        var colStart = 0
        var rowStart = 0

        while (rowStart <= rowEnd && colStart <= colEnd) {
            // 우
            for (i in colStart..colEnd) {
                ret.add(matrix[rowStart][i])
            }
            rowStart++

            // 하
            for (i in rowStart..rowEnd) {
                ret.add(matrix[i][colEnd])
            }
            colEnd--

            // 좌
            if (rowEnd >= rowStart) {
                for (i in colEnd downTo colStart) {
                    ret.add(matrix[rowEnd][i])
                }
            }
            rowEnd--

            // 상
            if (colEnd >= colStart) {
                for (i in rowEnd downTo rowStart) {
                    ret.add(matrix[i][colStart])
                }
            }
            colStart++
        }
        return ret
    }
}
