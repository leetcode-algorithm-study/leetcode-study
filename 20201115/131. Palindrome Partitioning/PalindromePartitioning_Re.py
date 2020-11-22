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
        
        
      
