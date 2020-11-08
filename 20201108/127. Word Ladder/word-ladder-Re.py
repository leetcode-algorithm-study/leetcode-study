from collections import deque
class Solution:
    def ladderLength(self, beginWord: str, endWord: str, wordList: List[str]) -> int:
        wordset = set(wordList)
        queue = deque()
        queue.append((beginWord, 1))
        leng = len(beginWord)
        while queue:
            word, layer = queue.popleft()
            if word == endWord:     #끝 단어랑 같으면 종료
                return layer
            for i in range(leng):
                for c in "abcdefghijklmnopqrstuvwxyz":
                    newWord = word[:i]+c+word[i+1:]     #현재 단어에서 바꿀 수 있는 모든 경우의 수
                    if newWord in wordset:
                        wordset.remove(newWord)         #삭제한다는 것은 visit(방문)했다는 것
                        queue.append((newWord, layer+1))
        return 0
