class TrieNode():
    def __init__(self):
        self.children = [None] * 26
        self.isWord = False

class WordDictionary:

    def __init__(self):
        self.root = TrieNode()
        

    def addWord(self, word: str) -> None:
        curr = self.root
        for c in word:
            i = ord(c) - ord('a')
            if curr.children[i] is None:
                curr.children[i] = TrieNode()
            curr = curr.children[i]
        curr.isWord = True

    def search(self, word: str) -> bool:
        def helper(word, cnt, root):
            if root is None:
                return False
            if len(word) == cnt:
                return root.isWord

            c = word[cnt]
            if c == '.':
                for i in range(26):
                    if helper(word, cnt + 1, root.children[i]):
                        return True
                return False
            else:
                i = ord(c) - ord('a')
                if root.children[i] is None:
                    return False
                return helper(word, cnt+1, root.children[i])

        return helper(word, 0, self.root)


# Your WordDictionary object will be instantiated and called as such:
# obj = WordDictionary()
# obj.addWord(word)
# param_2 = obj.search(word)