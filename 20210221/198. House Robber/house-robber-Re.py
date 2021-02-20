class Solution:
    def rob(self, nums: List[int]) -> int:
        if len(nums) == 0:
            return 0
        elif len(nums) == 1:
            return nums[0]
        elif len(nums) == 2:
            return max(nums)

        dp = [0 for i in range(len(nums))]
        dp[0] = nums[0]
        dp[1] = max(dp[0], nums[1])

        for i in range(len(nums) - 2):
            dp[i + 2] = max(dp[i + 1], dp[i] + nums[i + 2])

        print(dp)
        return dp[-1]