from itertools import permutations
class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        k=list(permutations(nums, len(nums)))
        k=list(map(list, k))
        return k
