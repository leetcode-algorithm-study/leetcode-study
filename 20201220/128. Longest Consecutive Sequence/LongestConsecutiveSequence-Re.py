class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        result = 0
        numChecker = [0 for _ in range(2 * (10 ** 9) + 1)]
        for num in nums:
            numChecker[num + 10 ** 9] = 1

        now = 0
        for checker in numChecker:
            if checker == 1:
                now += 1
            else:
                if result < now:
                    result = now
                now = 0

        print(result)
# Memory Limit Exceeded