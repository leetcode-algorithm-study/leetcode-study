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

 /**
 * Runtime: 15 ms, faster than 72.26% of Java online submissions for Binary Search Tree Iterator.
 * Memory Usage: 42.8 MB, less than 34.93% of Java online submissions for Binary Search Tree Iterator.
 */
class BSTIterator {

    private Stack<TreeNode> stack = new Stack<>();
    
    public BSTIterator(TreeNode root) {
        while (root != null) {
            stack.push(root);
            root = root.left;
        }
    }

    public int next() {
        TreeNode next = stack.pop();
        if(next.right != null){
            TreeNode tn = next.right;
            while(tn != null){
                stack.push(tn);
                tn = tn.left;
            }
        }
        return next.val;
    }

    public boolean hasNext() {
        return !stack.isEmpty() ? true : false;
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * BSTIterator obj = new BSTIterator(root);
 * int param_1 = obj.next();
 * boolean param_2 = obj.hasNext();
 */