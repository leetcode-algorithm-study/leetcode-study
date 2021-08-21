class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        var array = Array(repeating: Array(repeating: 0, count: n), count: m)

        // 장애물 탐색
        for i in 0..<m {
            if obstacleGrid[i][0] != 1 {
                array[i][0] = 1
            }
        }
        
        for j in 0..<n {
            if obstacleGrid[0][j] != 1 {
                array[0][j] = 1
            }
        }
        
        for i in 1..<m {
            for j in 1..<n {
                if obstacleGrid[i][j] != 1 {
                    array[i][j] = array[i-1][j] + array[i][j-1]
                }
            }
        }
        
        return array[m-1][n-1]
    }
}
