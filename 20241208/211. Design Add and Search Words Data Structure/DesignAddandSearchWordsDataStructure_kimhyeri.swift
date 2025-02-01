class WordDictionary {
    class TrieNode {
        var isWord = false
        var children = [Character: TrieNode]()
    }
    
    let root = TrieNode()
    
    init() { }
    
    func addWord(_ word: String) {
        var node = root
        for char in word {
            if node.children[char] == nil {
                node.children[char] = TrieNode()
            }
            node = node.children[char]!
        }
        node.isWord = true
    }
    
    func search(_ word: String) -> Bool {
        return searchRecursive(Array(word), 0, root)
    }
    
    private func searchRecursive(_ word: [Character], _ index: Int, _ node: TrieNode) -> Bool {
        if index == word.count {
            return node.isWord
        }
        
        let char = word[index]
        if char == "." {
            for child in node.children.values {
                if searchRecursive(word, index + 1, child) {
                    return true
                }
            }
            return false
        } else {
            if let child = node.children[char] {
                return searchRecursive(word, index + 1, child)
            } else {
                return false
            }
        }
    }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */