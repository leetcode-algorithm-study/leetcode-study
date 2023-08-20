class Solution {
    fun setZeroes(matrix: Array<IntArray>): Unit {
        val zeroPositions = findZero(matrix)
        if(zeroPositions.isEmpty()) return
        update(matrix, zeroPositions)
    }

    fun findZero(matrix: Array<IntArray>): Queue<Pair<Int, Int>> {
        val queue: Queue<Pair<Int,Int>> = LinkedList()
        for(i in 0 until matrix.size) {
            for(j in 0 until matrix[i].size) {
                if(matrix[i][j] == 0) {
                    queue.add(Pair(i,j))
                }
            }
        }
        return queue
    }

    fun update(matrix: Array<IntArray>, zeroPositions: Queue<Pair<Int, Int>>) {
        for(i in 0 until matrix.size) {
            for(j in 0 until matrix[i].size) {
                if(i == zeroPositions.peek().first && j == zeroPositions.peek().second) {
                    val (tempI, tempJ) = zeroPositions.poll()
                    update(matrix, tempI, tempJ)
                }
                if(zeroPositions.isEmpty()) {
                    return
                }
            }
        }
    }

    fun update(matrix: Array<IntArray>, i: Int, j: Int) {
        val n = matrix.size
        val m = matrix[i].size

        //col 채우기
        for(temp in 0 until n) {
            matrix[temp][j] = 0
        }

        //row 채우기
        for(temp in 0 until m) {
            matrix[i][temp] = 0
        }
    }
}
