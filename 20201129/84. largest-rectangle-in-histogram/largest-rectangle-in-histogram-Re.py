class Solution:
    def largestRectangleArea(self, heights: List[int]) -> int:
        #Step 1 Brute Force
        result=0
        for i in range(len(heights)):
            for j in range(i, len(heights)):
                if result<(j-i+1)*min(heights[i:j+1]):
                    result=(j-i+1)*min(heights[i:j+1])
        return result
    
    
