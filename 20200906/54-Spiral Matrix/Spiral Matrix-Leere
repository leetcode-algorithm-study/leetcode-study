from collections import deque
dx=[(1,0),(0,-1),(-1,0),(0,1)]
class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        if matrix==[]:
            return []
        all=len(matrix)*len(matrix[0])
        result=[]
        newM=
        result=matrix.pop(0)
        
        dxIndex=0
        while all!=len(result):
            if dxIndex==4:  
                dxIndex=0
                
            if dxIndex==0:
                for i in range(len(matrix)):
                    result.append(matrix[i].pop())
            elif dxIndex==1:
                for i in range(len(matrix[0])):
                    result.append(matrix[-1].pop())
                matrix.pop()
            elif dxIndex==2:
                t=len(matrix)
                for i in range(t):
                    result.append(matrix[t-(i+1)].pop(0))
            elif dxIndex==3:
                t=len(matrix[0])
                for i in range(t):
                    result.append(matrix[0].pop(0))
                matrix.pop(0)
            
            dxIndex+=1
        return result
