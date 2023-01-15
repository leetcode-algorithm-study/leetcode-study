class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        } else if nums.count == 2 {
            return max(nums[0], nums[1])
        } else {
            var nums = nums

            for i in 2..<nums.count {
                let maxValue = nums[0...i-2].max()!
                nums[i] = nums[i] + maxValue
            }
            return nums.max()!
        }
    }
}
// 1
// [1, 2, 4, 1]
// -----
// 2
// [1, 2, 4, 3]
// -----

// 2
// [2, 7, 11, 3, 1]
// -----
// 7
// [2, 7, 11, 10, 1]
// -----
// 11
// [2, 7, 11, 10, 12]
// -----
