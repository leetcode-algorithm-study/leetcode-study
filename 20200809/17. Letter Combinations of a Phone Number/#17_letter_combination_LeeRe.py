class Solution:
    def letterCombinations(self, digits: str) -> List[str]:
        numbers={'2':'abc', '3':'def', '4':'ghi', '5':'jkl', '6':'mno', '7':'pqrs', '8':'tuv', '9':'wxyz'}
        
        k=[]
        for i,d in enumerate(digits):
            letter=numbers[d]
            
            temp=[]
            for ch in letter:
                if len(k)==0:
                    temp.append(ch)
                else:
                    for t in k:
                        temp.append(t+ch)
            k=temp
        return k
