class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var index = 0
    
        for i in nums {
            if i == target {
                return index
            } else {
                index = index + 1
            }
        }
        return -1
    }
}
