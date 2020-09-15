from itertools import combinations
class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        result=[]
        for i in range(len(nums)+1):
            temp=list(map(list,combinations(nums,i)))
            for t in temp:
                result.append(t)
        return result
    
# Runtime: 32 ms, faster than 81.23% of Python3 online submissions for Subsets.
# Memory Usage: 14.2 MB, less than 5.21% of Python3 online submissions for Subsets.
