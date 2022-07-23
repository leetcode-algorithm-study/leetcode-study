class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        
        
        #1. 앞에 문제처럼 dp[i] 를 nums[i] 까지의 최대 곱을 저장하는걸로 하니까 에외가 많음
        #2. 0, -부호. 조건을 바꿔도 힘들다.  다른 방법으로해야함      
#         len_ = len(nums)
#         dp = []
#         dp.append(nums[0])
#         max_ = dp[0]
        
#         # -3,-1,-1
#         # 0, 2
#         # -2, 0, -1
#         for i in range(1, len_):
#             dp.append(dp[i-1] * nums[i] if nums[i] > 0 else 0)
            
#             dp[i-1] == 0 ? nums[i]
            
#             max_ = max(dp[i], max_)

        max_, min_, ans = nums[0], nums[0], nums[0]
    
        for i in range(1, len(nums)):
            x = max(nums[i], max_*nums[i], min_*nums[i])
            y = min(nums[i], max_*nums[i], min_*nums[i])      
            
            max_, min_ = x, y
            ans = max(max_, ans)
            
        return ans