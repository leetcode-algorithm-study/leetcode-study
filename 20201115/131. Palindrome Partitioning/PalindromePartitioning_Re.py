class Solution(object):
    def partition(self, s):
        def isPal(s):
            return s == s[::-1]
        
        
        def dfs(s, path, res):
            if not s:
                res.append(path)
                return
            for i in range(len(s)):
                if isPal(s[:i+1]):
                    dfs(s[i+1:], path+[s[:i+1]], res)
                    
        
    
        res = []
        dfs(s,[],res)
        return res
        
#Solution 2 - DP (Not Solved)
      
# class Solution:
    
#     def partition(self, s: str) -> List[List[str]]:
#         def IsPalindrome(a):
#             if a==a[::-1]:
#                 return True
#             return False
#         if s=='':
#             return []
        
#         dp=[[0 for i in range(len(s))] for i in range(len(s))]
#         for i in range(len(s)):
#             for j in range(i+1,len(s)+1):
#                 if IsPalindrome(s[i:j])==True:
#                     dp[i][j-1]=1
        
#         for i in dp:
#             print(i)
            
        
