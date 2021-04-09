
/**
 * Runtime: 4 ms
 * Memory Usage: 41.1 MB
 */
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        if(root == null || root == p || root == q) return root;

        TreeNode left = lowestCommonAncestor(root.left, p, q); //좌측
        TreeNode right = lowestCommonAncestor(root.right, p, q); //우측

        if(left == null) return right;
        else if(right == null) return left;
        else return root;
    }
}