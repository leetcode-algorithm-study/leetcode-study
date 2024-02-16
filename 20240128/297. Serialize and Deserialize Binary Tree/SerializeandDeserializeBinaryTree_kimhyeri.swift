/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    // 직렬화, Tree -> Str
    func serialize(_ root: TreeNode?) -> String {
        var str = [String]()

        func dfs(root: TreeNode?) {
            guard let root = root else {
                str.append("nil")
                return
            }
            str.append(String(root.val))
            dfs(root: root.left)
            dfs(root: root.right)
        }

        dfs(root: root)
        return str.joined(separator: ",")
    }
    
    // 역직렬화, Str -> Tree
    func deserialize(_ data: String) -> TreeNode? {
        let split = data.split(separator: ",").map({Int(String($0))})
        var index = 0

        func setupTree() -> TreeNode? {
            guard let value = split[index] else {
                index = index + 1
                return nil
            }

            let root = TreeNode(value)
            index = index + 1
            root.left = setupTree()
            root.right = setupTree()
            return root
        }

        return setupTree()
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))