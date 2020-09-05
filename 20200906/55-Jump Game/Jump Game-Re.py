from collections import deque
class Solution:
    def canJump(self, nums: List[int]) -> bool:
        visit=[0 for _ in range(len(nums))]
        queue=deque()
        queue.append([0,nums[0]])
        
        if len(nums)==1:
            return 1
        while queue:
            if visit[len(nums)-1]==1:
                return 1
            now, jump=queue.popleft()
            for i in range(1, jump+1):
                if now+i<len(nums):
                    if visit[now+i]==0:
                        visit[now+i]=1
                        if now+i+nums[now+i]>now+jump:
                            queue.append([now+i, nums[now+i]])
        
        if visit[-1]==1:
            return 1
        print(visit)
        return 0
        
