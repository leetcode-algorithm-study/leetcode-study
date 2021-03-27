class Node(object):
    def __init__(self, key, data=None):
        self.key = key
        self.data = data
        self.children = {}

class Trie(object):

    def __init__(self):
        self.head = Node(None)

    def insert(self, word):
        curr_node = self.head

        for char in word:
            if char not in curr_node.children:
                curr_node.children[char] = Node(char)

            curr_node = curr_node.children[char]
        curr_node.data = word

    def search(self, word):
        curr_node = self.head

        for char in word:
            if char in curr_node.children:
                curr_node = curr_node.children[char]
            else:
                return False

        if (curr_node.data != None):
            return True

    def startsWith(self, prefix):
        curr_node = self.head

        for char in prefix:
            if char in curr_node.children:
                curr_node = curr_node.children[char]
            else:
                return False

        return True

# Runtime: 200 ms, faster than 48.88% of Python online submissions for Implement Trie (Prefix Tree).
# Memory Usage: 40.8 MB, less than 29.40% of Python online submissions for Implement Trie (Prefix Tree).