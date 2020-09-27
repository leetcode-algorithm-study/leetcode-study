import re
class Solution:
    def isMatch(self, s: str, p: str) -> bool:
        m = re.match(p,s)
        if m !=None:
            return m.group()==s
        return False
    
# Runtime: 60 ms, faster than 55.64% of Python3 online submissions for Regular Expression Matching.
# Memory Usage: 14.4 MB, less than 5.06% of Python3 online submissions for Regular Expression Matching.
