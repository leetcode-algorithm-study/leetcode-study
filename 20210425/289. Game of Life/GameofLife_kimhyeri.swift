class Solution {
    // in-place 수정 필요
    func gameOfLife(_ board: inout [[Int]]) {
        
        let row = board.count
        let col = board[0].count
        
        var result = Array(repeating: Array(repeating: 0, count: col), count: row)
        
        var directions = [[-1, 0], [-1,1], [0, 1],
                          [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1]]
        
        for i in 0..<row {
            for j in 0..<col {
                var count = 0
                for dir in directions {
                    let x = i + dir[0]
                    let y = j + dir[1]
                    if x >= 0, x < row, y >= 0, y < col, board[x][y] == 1 {
                        count = count + 1
                    }
                }
                // 현재 죽은셀, 주변 카운트 3
                if board[i][j] == 0, count == 3 {
                    result[i][j] = 1
                } 
                // 현재 살아있는셀
                else if board[i][j] == 1 {
                    // 주변 카운트 2, 3
                    if count == 2 || count == 3 {
                        result[i][j] = 1
                    }
                }
            }
        }

        for i in 0..<row {
            for j in 0..<col {
                board[i][j] = result[i][j]
            }
        }
    }
}
