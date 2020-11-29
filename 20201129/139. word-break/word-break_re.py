from collections import deque
class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        dic=dict()
        
        noMatch=0
        
        for i in range(len(s)):
            dic[i]=[]
        for i in range(len(s)):
            for word in wordDict:
                if (i+len(word))<=len(s) and s[i:i+len(word)]==word:
                    noMatch=1
                    dic[i].append(i+len(word))
                    
        if noMatch==0:
            return False
        
        queue=deque(dic[0])
        
        while queue:
            data=queue.popleft()
            if data==len(s):
                return True
            for i in dic[data]:
                queue.append(i)
        return False
        
