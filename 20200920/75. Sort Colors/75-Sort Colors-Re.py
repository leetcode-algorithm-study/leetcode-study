class Solution:
    def sortColors(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        dic=dict()
        for i in range(3):
            dic[i]=0
            
        for num in nums:
            dic[num]+=1
        
        color=0
        index=0
        for value in dic.values():
            for i in range(value):
                nums[index+i]=color
            index+=value
            color+=1

# Runtime: 32 ms, faster than 77.52% of Python3 online submissions for Sort Colors.
# Memory Usage: 13.7 MB, less than 88.52% of Python3 online submissions for Sort Colors.
