class Solution {
    func wiggleSort(_ nums: inout [Int]) {
        var sorted = nums.sorted()
        
        let n = nums.count
        
        for i in stride(from: 1, to:n , by: 2) {
            nums[i] = sorted.removeLast()
        }
        
        for i in stride(from: 0, to:n , by: 2) {
            nums[i] = sorted.removeLast()
        }
    }
}
