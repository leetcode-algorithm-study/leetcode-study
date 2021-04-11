class Solution:
    def maxArea(self, height: List[int]) -> int:
        start=0
        end=len(height)-1
        width=0
        
        while start<end:
            value=(end-start)*min(height[start], height[end])
            
            if width<value:
                width=value
                
            if height[start]<height[end]:
                start+=1
            else:
                end-=1
                
        return width
