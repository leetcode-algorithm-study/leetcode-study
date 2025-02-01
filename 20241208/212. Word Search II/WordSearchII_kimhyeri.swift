class Solution {
    class TrieNode {
        var word: String?
        var children = [Character: TrieNode]()
    }

    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        if board.isEmpty { return [] }

        var result = [String]()
        var board = board
        let root = buildTrie(with: words)

        for i in 0..<board.count {
            for j in 0..<board[0].count {
                dfs(&board, i, j, root, &result)
            }
        }

        return result
    }

    func buildTrie(with words: [String]) -> TrieNode {
        let root = TrieNode()

        for word in words {
            var node = root
            for char in word {
                if node.children[char] == nil{
                    node.children[char] = TrieNode()
                }
                node = node.children[char]!
            }
            node.word = word
        }

        return root
    }

    func dfs(_ board: inout [[Character]], _ i: Int, _ j: Int, _ node: TrieNode, _ result: inout [String]) {
        if i < 0 || j < 0 || i >= board.count || j >= board[0].count { return }
        guard let currentNode = node.children[board[i][j]] else { return }

        if let word = currentNode.word { 
            result.append(word) 
            currentNode.word = nil
        }
        let char = board[i][j]
        board[i][j] = "#" // 방문한 곳은 재방문 하지 않도록

        let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        for (dx, dy) in directions {
            let x = i + dx
            let y = j + dy
            dfs(&board, x, y, currentNode, &result)
        }
        board[i][j] = char
    }
}