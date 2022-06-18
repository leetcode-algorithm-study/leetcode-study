class Solution {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        var answer = [Int]()
        var row = mat.count
        var column = mat.first!.count
        
        if r * c != row * column {
            return mat
        } else {
            for i in mat {
                for j in i {
                    answer.append(j)
                }
            }

            var new = Array(repeating: Array(repeating: 0, count: c), count: r)

            for i in 0..<r {
                for j in 0..<c {
                    new[i][j] = answer.removeFirst()
                }
            }

            return new
        }
    }
}
