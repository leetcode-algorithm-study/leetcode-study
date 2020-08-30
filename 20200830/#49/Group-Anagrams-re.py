class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        all=[]
        for i in strs:
            visit=[0 for i in range(26)]
            for j in i:
                visit[ord(j)-97]+=1
            if visit not in all:
                all.append(visit)
        newOne=[[] for i in range(len(all))]
        
        for i in strs:
            visit=[0 for i in range(26)]
            for j in i:
                visit[ord(j)-97]+=1
            where=all.index(visit)

            newOne[where].append(i)

        return newOne
