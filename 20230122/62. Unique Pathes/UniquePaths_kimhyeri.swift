class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
    
        var matrix = Array(repeating: Array(repeating: 1, count: n), count: m)
                
        for i in 1..<m {
            for j in 1..<n {
                matrix[i][j] = matrix[i][j - 1] + matrix[i - 1][j]
            }
        }
        
        return matrix.last?.last ?? 0
    }
}
