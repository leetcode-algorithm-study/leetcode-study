
class Solution {
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        
        let direction = [[1,0],[0,1],[-1,0],[0,-1]]
        var count = 0
        var answer = 0
        var visited = Array(repeating: Array(repeating: false, count: matrix[0].count), count: matrix.count)
        
        func dfs(x: Int, y: Int) {
            visited[x][y] = true
            
            for dir in direction {
                let newX = x + dir[0]
                let newY = y + dir[1]
                if newX >= 0, newX < matrix.count, newY >= 0, newY < matrix[0].count, !visited[newX][newY] {
                    if matrix[x][y] < matrix[newX][newY] {
                        count = count + 1
                        dfs(x: newX, y: newY)
                    }
                }
            }
            visited[x][y] = false
        }
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                dfs(x: i, y: j)
                if count >= answer {
                    answer = count
                }
                count = 0
            }
        }
        return answer
    }
}
