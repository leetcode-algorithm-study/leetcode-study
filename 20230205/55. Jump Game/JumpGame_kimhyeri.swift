class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var nums = nums
        var i = 0
        
        if nums.count == 1 { return true }
        
        while i < nums.count - 1 {
            let nextIndex = i + nums[i]
            // 도달 가능한 범위
            if nextIndex < nums.count - 1 {
                for j in i ..< nextIndex {
                    if nums[j] == 0 {
                        nums[j] = 1
                    }
                }
            }
            // 도달 가능한 범위가 아닐 때
            else {
                for j in i ..< nums.count {
                    if nums[j] == 0 {
                        nums[j] = 1
                    }
                }
            }
            i += 1
        }
        
        return nums.contains(0) ? false : true
    }
}
