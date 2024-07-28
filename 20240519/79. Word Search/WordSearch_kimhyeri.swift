class Solution {
    struct Position {
         var x: Int, y: Int
     }

     func exist(_ board: [[Character]], _ word: String) -> Bool {
         // 가로 세로 사이즈
         let row = board.count
         let col = board[0].count
         let word = Array(word)

         // 비교할 글자수가 더 많을 때
         if row * col < word.count { return false }

         // 우 상 하 좌 움직일 수 있도록
         let moveX = [1, 0, -1, 0]
         let moveY = [0, 1, 0, -1]

         var visited = Array(repeating: Array(repeating: false, count: col),count: row)

         // word[count]로 접근하기 위함
         var count = 0

         func dfs(_ position: Position) -> Bool {
             guard count < word.count else { return false }

             // 배열은 여러 수지만 word는 한 단어 일때
             if word.count == 1 {
                 return true
             }

             visited[position.x][position.y] = true
             count = count + 1

             // 상 하 좌 우
             for i in 0...3 {
                 let x = position.x + moveX[i]
                 let y = position.y + moveY[i]
                 // avoid edge
                 if x > -1, y > -1, x < row, y < col, count < word.count, !visited[x][y] {
                     if board[x][y] == word[count] {
                        // 끝에 도달했음
                         if count == word.count - 1 {
                             return true
                         } else {
                            if dfs(Position(x: x, y: y)) {
                                return true
                            } else {
                                visited[x][y] = false
                                count = count - 1
                            }
                         }
                     }
                 }
             }
            return false
         }

         // 시작점
         for i in 0..<row {
             for j in 0..<col {
                 if board[i][j] == word.first {
                    if dfs(Position(x: i, y: j)) {
                        return true
                    } else {
                        count = 0
                        visited = Array(repeating: Array(repeating: false, count: col), count: row)
                    }
                 }
             }
         }
         return false
     }

}