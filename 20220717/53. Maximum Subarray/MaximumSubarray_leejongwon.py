class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
            
        #1. f(list, start, end) -> window(=end-start), cursor 등 복잡해짐  
#          window_size = 1
#         cache_sum_outter = 0
        
#         while window_size < len(nums) // 2:
            
#             cursor = 0 
#             calculating = 0
#             cache_sum_inner = 0
            
#             ....
            
#             if cache_sum_outter < cache_sum_inner:
#                 cache_sum_outter = cache_sum_inner
            
#             cursor += 1
            
#         return cache_sum_outter
#         ############################
                
    
        #2. devide and qonquer. 나눠서 다시 합친다. 그래서 뭐 어떡하면 됨?ㅇㅅㅇ
        
        
        #3. 똑같은 고민을 한 사람이 있음
        # https://leetcode.com/problems/maximum-subarray/discuss/20193/DP-solution-and-some-thoughts
        
        #4. f(l, end) 만 남길 수 있지 않을까
        #dp[i] -> l[0:i] 까지의 max 값.
        
        len_ = len(nums)
        dp = []
        dp.append(nums[0])
        max_ = dp[0]
        
        for i in range(1, len_):
            dp.append(nums[i] + (dp[i-1] if dp[i-1] > 0 else 0))
            max_ = max(dp[i], max_)
            
        return max_
            
        
        
        
       