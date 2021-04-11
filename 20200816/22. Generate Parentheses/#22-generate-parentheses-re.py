from itertools import permutations
class Solution:
    def generateParenthesis(self, n: int) -> List[str]:
        k=[]
        for i in range(n):
            k.append(')')
            k.append('(')
        print(k)
        t=list(permutations(k,n*2))
        kk=[]
        for i in t:
            value="".join(i)
            if value not in kk:
                kk.append(value)
        kkk=[]
        for i in kk:
            stack=[]
            for j in i:
                if j=='(':
                    stack.append('(')
                else:
                    if len(stack)!=0:
                        if stack[-1]=='(':
                            stack.pop()
                        else:
                            stack.append(')')
                    else:
                        stack.append(')')
            if len(stack)==0:
                kkk.append(i)
        print(kkk)
        return kkk
