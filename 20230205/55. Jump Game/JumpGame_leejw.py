class Solution:
    def canJump(self, nums: List[int]) -> bool:

        #인덱스에서 도달할 수 있는 최대 거리
        dp = [-1] * len(nums)
        dp[0] = nums[0]

        for i in range(1, len(nums)):
            if dp[i - 1] > 0:
                dp[i] = max(dp[i - 1] - 1, nums[i])
            else:
                return False

        return dp[len(nums) - 1] != -1