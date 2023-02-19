/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        var oldToNew: [Node: Node] = [:]
        
        func clone(_ node: Node?) -> Node? {
            guard let node = node else { return nil }
            
            if let new = oldToNew[node] {
                return new
            }
            
            let copy = Node(node.val)
            oldToNew[node] = copy
            
            for neighbor in node.neighbors {
                copy.neighbors.append(clone(neighbor))
            }
            
            return copy
        }
        
        return clone(node)
    }
}
