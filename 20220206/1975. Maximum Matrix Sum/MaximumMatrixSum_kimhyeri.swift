// 짝수면 모든 값을 non negative하게 만들 수 있음
// 홀수면 모든 값을 non negative하게 만들 수 있음 (한 값 빼고)
// 절대값으로 가장 작은 값을 구하면 된다.

class Solution {
    func maxMatrixSum(_ matrix: [[Int]]) -> Int {
        let n = matrix.count
        let m = matrix.first?.count
        var ans = 0
        var minimum = Int.max
        var negative = 0

        for i in 0..<n {
            for j in 0..<m! {
                if matrix[i][j] < 0 {
                    negative = negative + 1
                }
                ans = ans + abs(matrix[i][j])
                minimum = min(minimum, abs(matrix[i][j]))
            }
        }
        
        // matrix 음수가 짝수
        if negative % 2 == 0 {
            return ans
        }
        // matrix 음수가 홀수
        else {
            return ans - minimum - minimum
        }
    }
}
