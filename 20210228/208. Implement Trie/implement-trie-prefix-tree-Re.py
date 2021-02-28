class Node(object):
    """
    A node that consists of a trie.
    """

    def __init__(self, key, data=None):
        self.key = key
        self.data = data
        self.children = {}


class Trie(object):

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.head = Node(None)

    def insert(self, word):
        """
        Inserts a word into the trie.
        :type word: str
        :rtype: None
        """
        curr_node = self.head

        for char in word:
            if char not in curr_node.children:
                curr_node.children[char] = Node(char)

            curr_node = curr_node.children[char]
        curr_node.data = word

    def search(self, word):
        """
        Returns if the word is in the trie.
        :type word: str
        :rtype: bool
        """
        curr_node = self.head

        for char in word:
            if char in curr_node.children:
                curr_node = curr_node.children[char]
            else:
                return False
        if (curr_node.data != None):
            return True

    def startsWith(self, prefix):
        """
        Returns if there is any word in the trie that starts with the given prefix.
        :type prefix: str
        :rtype: bool
        """
        curr_node = self.head
        result = []
        subtrie = None

        for char in prefix:
            if char in curr_node.children:
                curr_node = curr_node.children[char]
                subtrie = curr_node
            else:
                return False

        return True

# Runtime: 200 ms, faster than 48.88% of Python online submissions for Implement Trie (Prefix Tree).
# Memory Usage: 40.8 MB, less than 29.40% of Python online submissions for Implement Trie (Prefix Tree).