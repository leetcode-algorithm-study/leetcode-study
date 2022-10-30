class Solution:
    def lengthOfLIS(self, nums: List[int]) -> int:
        if len(nums) == 0:
            return 0

        result = []

        for num in nums:
            if len(result) == 0 or result[-1] < num:
                result.append(num)
            else:
                i = bisect_left(result, num)
                result[i] = num

        return len(result)

