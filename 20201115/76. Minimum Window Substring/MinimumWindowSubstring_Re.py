class Solution:
    def minWindow(self, s: str, t: str) -> str:
        left=0
        right=0
        toggle=0    #0일때 right 이동, 1일때 left 이동
        setT=set(t)
        result=[]
        hi=0
        while 1:
            if toggle==0:
                right+=1
                if right==len(s):
                    toggle=1
                    hi=1
                    continue
                if set(s[left:right])&setT==setT:   #교집합이 setT일 ㄸ때
                    result.append(s[left:right])
                else:
                    toggle=1
                    continue
            else:
                left+=1
                if left==right:
                    if hi==1:
                        break
                    toggle=0
                    continue
                if set(s[left:right])&setT==setT:
                    result.append(s[left:right])
                else:
                    if hi==1:
                        break
                    toggle=0
        print(result)
