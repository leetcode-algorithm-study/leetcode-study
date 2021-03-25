/**
 * Runtime: 1 ms
 * Memory Usage: 38.7 MB
 */

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public int kthSmallest(TreeNode root, int k) {
        Stack<TreeNode> s = new Stack();
        ArrayList<TreeNode> list = new ArrayList();
        int count = 0;
        while(root != null) {
            s.push(root);
            root = root.left;
        }

        while(count != k) {
            TreeNode tn = s.pop();
            count++;
            list.add(tn);
            TreeNode temp = tn.right;
            if(temp != null) {
                s.push(temp);
                while(temp.left != null) {
                    temp = temp.left;
                    s.push(temp);
                }
            }
        }

        return list.get(count-1).val;
    }
}