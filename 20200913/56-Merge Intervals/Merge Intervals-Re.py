class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        intervals.sort(key=lambda x : (x[0], x[1]))

        result=[]
        if intervals==[]:
            return []
        first=intervals[0]
        for i in range(1, len(intervals)):
            if first[0]<=intervals[i][0]<=first[1]:
                if first[1]<intervals[i][1]:
                    first[1]=intervals[i][1]
            else:
                result.append(first)
                first=intervals[i]
        result.append(first)
        
        return result
    
# Runtime: 84 ms, faster than 93.80% of Python3 online submissions for Merge Intervals.
# Memory Usage: 15.5 MB, less than 89.54% of Python3 online submissions for Merge Intervals.
