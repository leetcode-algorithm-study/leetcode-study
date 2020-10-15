import sys
class Solution:
    def firstMissingPositive(self, nums: List[int]) -> int:
        dic=dict()
        for num in nums:
            if num>0:
                dic[num]=1
        first=1
        while 1:
            if first not in dic:
                return first
            else:
                first+=1
        return first

# Runtime: 32 ms, faster than 83.63% of Python3 online submissions for First Missing Positive.
# Memory Usage: 14.1 MB, less than 100.00% of Python3 online submissions for First Missing Positive.
