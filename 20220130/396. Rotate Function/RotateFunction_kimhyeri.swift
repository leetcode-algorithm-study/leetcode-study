class Solution {
    func maxRotateFunction(_ nums: [Int]) -> Int {
        var sum = 0
        var k = 0
        var temp = 0
        var ans = 0

        for i in 0..<nums.count {
            temp = temp + i * nums[i]
            sum = sum + nums[i]
        }

        ans = temp
        
        for i in 1..<nums.count {
            temp = temp + sum - nums.count * nums[nums.count - i]
            ans = max(temp, ans)
        }

        return ans
    }
}
