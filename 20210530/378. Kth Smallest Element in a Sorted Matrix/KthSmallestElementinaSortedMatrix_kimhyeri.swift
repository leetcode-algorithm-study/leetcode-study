class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        let array = matrix.flatMap{$0}.sorted()
        return array[k-1]
    }
}
