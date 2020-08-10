from itertools import combinations
class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        d=list(combinations(nums, 3))
        k=[]
        for i in d:
            if sum(i)==0:
                t=list(i)
                t.sort()
                if t not in k:
                    k.append(t)
        
        return k
