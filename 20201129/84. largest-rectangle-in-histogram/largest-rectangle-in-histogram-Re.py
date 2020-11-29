class Solution:
    def largestRectangleArea(self, heights: List[int]) -> int:
        #Step 1 Brute Force
        result=0
        for i in range(len(heights)):
            for j in range(i, len(heights)):
                row=j-i+1
                col=heights[i:j+1]
                if result<row*col:
                    result=row*col
        return result
    
    
