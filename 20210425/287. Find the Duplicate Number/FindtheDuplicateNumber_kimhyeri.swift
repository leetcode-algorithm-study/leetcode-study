class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        
        for i in nums {
            if let value = dict[i] {
                return i
            } else {
                dict[i] = 1
            }
        }
        return 0
    }
}
