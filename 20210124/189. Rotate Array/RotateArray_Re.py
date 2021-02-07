class Solution:
    def rotate(self, nums: List[int], k: int) -> None:
        k %= len(nums)

        def reverseNum(nums, start, end):
            while start < end:
                nums[start], nums[end] = nums[end], nums[start]
                start, end = start + 1, end - 1

        reverseNum(nums, 0, len(nums) - 1)
        reverseNum(nums, 0, k - 1)
        reverseNum(nums, k, len(nums) - 1)