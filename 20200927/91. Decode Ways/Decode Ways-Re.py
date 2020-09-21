import sys
input=sys.stdin.readline
class Solution:
    def numDecodings(self, s: str) -> int:
        dp=[0 for i in range(len(s))]
        
        dp[0]=1
        if s[0]=='0':
            dp[0]=0
            
        if len(s)>=2:
            if 0<int(s[:2])<=26:
                if len(str(int(s[:2])))==2:
                    dp[1]+=1
            if s[0]!='0' and s[1]!='0':
                dp[1]+=1
        
        if len(s)>=3:
            for i in range(2, len(s)):
                if 0<int(s[i-1:i+1])<=26:
                    if len(str(int(s[i-1:i+1])))==2:
                        dp[i]+=dp[i-2]
                if s[i]!='0':
                    dp[i]+=dp[i-1]
                    
        return dp[-1]
    
# Runtime: 32 ms, faster than 76.65% of Python3 online submissions for Decode Ways.
# Memory Usage: 13.8 MB, less than 68.33% of Python3 online submissions for Decode Ways.
