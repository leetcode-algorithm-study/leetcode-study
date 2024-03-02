
// 트라이 노드
class TrieNode {
    var isWord = false
    var children = [Character: TrieNode]()
}

class Trie {
    let root = TrieNode()
    
    // 단어 삽입 부분
    func insert(_ word: String) {
        var node = root
        for char in word {
            if node.children[char] == nil {
                node.children[char] = TrieNode()
            }
            node = node.children[char]!
        }
        node.isWord = true
    }
    
    // 단어 존재 여부 판별
    func search(_ word: String) -> Bool {
        if let node = find(word) {
            return node.isWord
        }
        return false
    }
    
    // 문자열로 시작 단어 존재 여부 판별
    func startsWith(_ prefix: String) -> Bool {
        return find(prefix) != nil
    }
    
    // 문자 단위로 깊이 탐색하기 위함
    func find(_ str: String) -> TrieNode? {
        var node = root
        for char in str {
            if node.children[char] == nil {
                return nil
            }
            node = node.children[char]!
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