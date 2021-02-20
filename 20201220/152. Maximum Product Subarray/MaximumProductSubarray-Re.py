class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        if nums == []:
            return 0

        result = nums[0]
        minValue = nums[0]
        maxValue = nums[0]

        for i in range(1, len(nums)):   #n-1
            one = max(nums[i], nums[i] * minValue, nums[i] * maxValue)      #3
            two = min(nums[i], nums[i] * minValue, nums[i] * maxValue)      #3

            if result < one:
                result = one

            maxValue = one
            minValue = two

        return result
# Runtime: 60 ms, faster than 26.41% of Python3 online submissions for Maximum Product Subarray.
# Memory Usage: 14.3 MB, less than 54.83% of Python3 online submissions for Maximum Product Subarray.


