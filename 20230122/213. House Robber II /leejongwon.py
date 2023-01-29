class Solution:
    def rob(self, nums: List[int]) -> int:

        if len(nums) == 1:
            return nums[0]
        if len(nums) == 2:
            return max(nums[0], nums[1])


        #
        cache = [nums[1:][i] for i in range(0, len(nums[1:]))]
        cache[1] = max(cache[0], cache[1])
        for i in range(2, len(nums[1:])):
            cache[i] = max(cache[i-1], cache[i-2] + nums[1:][i])
        result = cache[len(cache) - 1]

        #
        cache = [nums[:-1][i] for i in range(0, len(nums[:-1]))]
        cache[1] = max(cache[0], cache[1])
        for i in range(2, len(nums[:-1])):
            cache[i] = max(cache[i-1], cache[i-2] + nums[:-1][i])

        # print(cache)
        return max(result, cache[len(cache) - 1])