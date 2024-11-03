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
    // Serializes a binary tree to a single string.
    func serialize(_ root: TreeNode?) -> String {
        var result = ""
        serializeHelper(root, &result)
        return result
    }
    
    private func serializeHelper(_ node: TreeNode?, _ result: inout String) {
        if let node = node {
            result += "\(node.val),"
            serializeHelper(node.left, &result)
            serializeHelper(node.right, &result)
        } else {
            result += "null,"
        }
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var nodes = data.split(separator: ",").map(String.init)
        return deserializeHelper(&nodes)
    }
    
    private func deserializeHelper(_ nodes: inout [String]) -> TreeNode? {
        guard !nodes.isEmpty else { return nil }
        
        let value = nodes.removeFirst()
        if value == "null" {
            return nil
        }
        
        let node = TreeNode(Int(value)!)
        node.left = deserializeHelper(&nodes)
        node.right = deserializeHelper(&nodes)
        
        return node
    }
}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))