import sys
sys.setrecursionlimit(10**8)
input=sys.stdin.readline
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
            
            if word=='':
                result+=1
                return 1
            
            for i in dx:
                y=row+i[0]
                x=col+i[1]
                if 0<=y<r and 0<=x<c and visit[y][x]==0 and board[y][x]==word[0]:
                    visit[y][x]=1
                    dfs(y,x,word[1:], visit)
                    visit[y][x]=0
            return 1

        for i in range(r):
            for j in range(c):
                if board[i][j]==word[0]:
                    visit[i][j]=1
                    dfs(i, j, word[1:], visit)
                    visit[i][j]=0
        
        if result==0:
            return 0
        else:
            return 1
        
# Runtime: 292 ms, faster than 96.03% of Python3 online submissions for Word Search.
# Memory Usage: 15.2 MB, less than 37.27% of Python3 online submissions for Word Search.
                
