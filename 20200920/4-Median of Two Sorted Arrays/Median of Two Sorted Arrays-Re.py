import heapq

class Solution:
    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:
        h = []
        length=len(nums1)+len(nums2)
        for num in nums1:
            heapq.heappush(h, (num, num))
        for num in nums2:
            heapq.heappush(h, (num, num))
        result=0
        if length%2==0:
            for i in range(length//2-1):
                heapq.heappop(h)
            result+=heapq.heappop(h)[0]
            result+=heapq.heappop(h)[0]
            result=result/2
        else:
            for i in range(length//2):
                heapq.heappop(h)
            result+=heapq.heappop(h)[0]
        return result
# Runtime: 116 ms, faster than 31.71% of Python3 online submissions for Median of Two Sorted Arrays.
# Memory Usage: 14.2 MB, less than 23.53% of Python3 online submissions for Median of Two Sorted Arrays.
