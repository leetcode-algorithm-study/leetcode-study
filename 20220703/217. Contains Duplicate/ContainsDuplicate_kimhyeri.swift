class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var dict = [Int: Int]()
        
        for i in nums {
            if let value = dict[i] {
                return true
            } else {
                dict[i] = 1
            }
        }
        
        return false
    }
}

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set = Set(nums)
        return !(set.count == nums.count)
    }
}
