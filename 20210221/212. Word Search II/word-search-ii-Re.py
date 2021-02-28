class Node(object):
    def __init__(self, key, data=None):
        self.key = key
        self.data = data
        self.children = {}


class Trie(object):
    def __init__(self):
        self.head = Node(None)

    def insert(self, string):
        curr_node = self.head

        for char in string:
            if char not in curr_node.children:
                curr_node.children[char] = Node(char)

            curr_node = curr_node.children[char]

        curr_node.data = string

    def dfs(self, row, col, address, visited, board):
        if board[row][col] in address.children:
            curr_node = address.children[board[row][col]]
            if curr_node.data != None:
                result.add(curr_node.data)

            for dir in direction:
                newRow = row + dir[0]
                newCol = col + dir[1]
                if (0 <= newRow < len(board) and 0 <= newCol < len(board[0]) and visited[newRow][newCol] == 0):
                    visited[newRow][newCol] = 1
                    self.dfs(newRow, newCol, curr_node, visited, board)
                    visited[newRow][newCol] = 0


direction=[(1,0),(-1,0),(0,1),(0,-1)]
board = [["o","a","a","n"],
         ["e","t","a","e"],
         ["i","h","k","r"],
         ["i","f","l","v"]]
words = ["oaa","oas","oass","oat","hklf", "hf"]
result=set()


class Solution(object):
    def findWords(self, board, words):
        global result
        t = Trie()
        result = set()

        for word in words:
            t.insert(word)
        print(t.head.children)
        print(t.head.children['o'].children)
        print(t.head.children['o'].children['a'].children)
        print(t.head.children['o'].children['a'].children['t'].children)
        for i in range(len(board)):
            for j in range(len(board[0])):
                visit = [[0 for _ in range(len(board[0]))] for _ in range(len(board))]
                visit[i][j] = 1
                t.dfs(i, j, t.head, visit, board)

        return list(result)

s=Solution()
print(s.findWords(board,words))

