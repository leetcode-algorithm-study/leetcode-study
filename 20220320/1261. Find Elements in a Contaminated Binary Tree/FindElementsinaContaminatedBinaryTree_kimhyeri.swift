/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class FindElements {
    
    var root: TreeNode?
    var array = [Int]()
    
    init(_ root: TreeNode?) {
        self.root = root
        
        settingUp(root, 0)
    }
    
    func find(_ target: Int) -> Bool {
        return array.contains(target)
    }
    
    func settingUp(_ node: TreeNode?, _ value: Int) {
        if node == nil { return }
        node?.val = value
        array.append(value)
        settingUp(node?.left, (node!.val * 2) + 1)
        settingUp(node?.right, (node!.val * 2) + 2)
    }
}

//TLE
//class FindElements {
//
//    var root: TreeNode?
//
//    init(_ root: TreeNode?) {
//        self.root = root
//
//        settingUp(root, 0)
//    }
//
//    func find(_ target: Int) -> Bool {
//        finding(root, target: target)
//    }
//
//    func finding(_ node: TreeNode?, target: Int) -> Bool {
//        print(node?.val)
//        if node?.val == target { return true }
//        if node?.left == nil && node?.right == nil { return false }
//        return finding(node?.left, target: target) || finding(node?.right, target: target)
//    }
//
//    func settingUp(_ node: TreeNode?, _ value: Int) {
//        if node == nil { return }
//        node?.val = value
//        settingUp(node?.left, (node!.val * 2) + 1)
//        settingUp(node?.right, (node!.val * 2) + 2)
//    }
//}
/**
 * Your FindElements object will be instantiated and called as such:
 * let obj = FindElements(root)
 * let ret_1: Bool = obj.find(target)
 */
