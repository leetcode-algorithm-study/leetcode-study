class Solution:
    def findPeakElement(self, nums: List[int]) -> int:

        for i in range(len(nums) - 1):
            prevIndex = i - 1
            nextIndex = i + 1

            if prevIndex >= 0:
                if nums[prevIndex] < nums[i] and nums[i] > nums[nextIndex]:
                    return i

        return nums.index(max(nums))

# Runtime: 76 ms, faster than 5.57% of Python3 online submissions for Find Peak Element.
# Memory Usage: 14.1 MB, less than 97.59% of Python3 online submissions for Find Peak Element.