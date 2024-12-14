class TrieNode {
    var isWord: Bool = false
    var children = [Character: TrieNode]() 
}

class Trie {
    let root: TrieNode

    init() {
        root = TrieNode()        
    }
    
    func insert(_ word: String) {
        var node = root

        for i in word {
            if node.children[i] == nil {
                node.children[i] = TrieNode()
            }
            node = node.children[i]!
        }
        
        node.isWord = true
    }
    
    func search(_ word: String) -> Bool {
        if let node = find(word) {
            return node.isWord
        } else {
            return false
        }
    }
    
    func startsWith(_ prefix: String) -> Bool {
        return find(prefix) != nil
    }

    func find(_ prefix: String) -> TrieNode? {
        var node = root
        for i in prefix {
            if node.children[i] == nil {
                return nil
            }
            node = node.children[i]!
        }
        return node
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */