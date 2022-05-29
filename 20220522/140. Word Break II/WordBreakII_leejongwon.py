class Solution:
    def wordBreak(self, s, wordDict):
        return self.helper(s, wordDict, {})
    
    def helper(self, s, wordDict, memo):
        if s in memo: 
            return memo[s]
        if not s: 
            return []
    
        res = []
        for word in wordDict:
            if not s.startswith(word):
                continue
                
            if len(word) == len(s):
                res.append(word)
            else:
                resultOfTheRest = self.helper(s[len(word):], wordDict, memo)
                for item in resultOfTheRest:
                    item = word + ' ' + item
                    res.append(item)
        memo[s] = res
        return res    