import sys
sys.setrecursionlimit(10**8)
dx=[(1,0),(-1,0),(0,1),(0,-1)]
result=0

class Solution:
    
    def exist(self, board: List[List[str]], word: str) -> bool:
        global result
        r, c=len(board), len(board[0])
        visit=[[0 for i in range(c)] for i in range(r)]
        result=0
        def dfs(row, col, word, visit):
            global result
            if result!=0:   #시간 줄이기
                return 1
            
            if word=='':    #종료 조건
                result+=1
                return 1
            
            for i in dx:    #dfs 돌기
                y=row+i[0]
                x=col+i[1]
                if 0<=y<r and 0<=x<c and visit[y][x]==0 and board[y][x]==word[0]:
                    visit[y][x]=1
                    dfs(y,x,word[1:], visit)
                    visit[y][x]=0
            return 1

        for i in range(r):  #word 시작 위치 탐색
            for j in range(c):
                if board[i][j]==word[0]:
                    visit[i][j]=1
                    dfs(i, j, word[1:], visit)
                    visit[i][j]=0
        
        if result==0:
            return 0
        else:
            return 1
        
# Runtime: 296 ms, faster than 95.36% of Python3 online submissions for Word Search.
# Memory Usage: 15.4 MB, less than 17.63% of Python3 online submissions for Word Search.
                
