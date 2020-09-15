import heapq
class Solution:
    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:
        h = []
        length=len(nums1)+len(nums2)
        result=0
        
        #Step 1 - init heapq
        for num in nums1:
            heapq.heappush(h, (num, num))
        for num in nums2:
            heapq.heappush(h, (num, num))
            
            
        #Step 2 - Distinguish even and odd numbers
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
    
# Runtime: 112 ms, faster than 35.17% of Python3 online submissions for Median of Two Sorted Arrays.
# Memory Usage: 14.1 MB, less than 48.27% of Python3 online submissions for Median of Two Sorted Arrays.
