class Solution:
    def setZeroes(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        zero=[]
        for i in range(len(matrix)):
            for j in range(len(matrix[0])):
                if matrix[i][j]==0:
                    zero.append([i,j])
        for hiLeeRe in zero:
            for i in range(len(matrix)):
                if matrix[i][hiLeeRe[1]]!=0:
                    matrix[i][hiLeeRe[1]]=0
            for i in range(len(matrix[0])):
                if matrix[hiLeeRe[0]][i]!=0:
                    matrix[hiLeeRe[0]][i]=0
                    
