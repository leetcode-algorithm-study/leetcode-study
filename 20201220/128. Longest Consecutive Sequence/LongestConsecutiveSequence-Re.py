class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        #First Fail Solution
        # result = 0
        # numChecker = [0 for _ in range(2 * (10 ** 9) + 1)]
        # for num in nums:
        #     numChecker[num + 10 ** 9] = 1
        #
        # now = 0
        # for checker in numChecker:
        #     if checker == 1:
        #         now += 1
        #     else:
        #         if result < now:
        #             result = now
        #         now = 0
        #
        # print(result)


        #Second Success Solution
        if nums == []:
            return 0

        result = 0
        minValue = min(nums)
        maxValue = max(nums)
        newNums = set(nums)

        now = 0

        for i in range(minValue, maxValue + 2):
            if i in newNums:
                now += 1
            else:
                if result < now:
                    result = now
                now = 0

        return result
    # Runtime: 52 ms, faster than 82.79% of Python3 online submissions for Longest Consecutive Sequence.
    # Memory Usage: 15.3 MB, less than 58.23% of Python3 online submissions for Longest Consecutive Sequence.