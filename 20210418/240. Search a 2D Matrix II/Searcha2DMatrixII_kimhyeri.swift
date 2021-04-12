class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        for i in matrix {
            if i.contains(target) {
                return true
            }
        }
        return false
    }
}
