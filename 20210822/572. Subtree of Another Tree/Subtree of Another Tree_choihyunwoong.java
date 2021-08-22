class Solution_572 {

      public class TreeNode {
      int val;
      TreeNode left;
      TreeNode right;
      TreeNode() {}
      TreeNode(int val) { this.val = val; }
      TreeNode(int val, TreeNode left, TreeNode right) {
          this.val = val;
          this.left = left;
          this.right = right;
      }
  }

  public static boolean checking(TreeNode node1, TreeNode node2){



          if(node1==null && node2==null)
              return true;

          if(node1==null || node2==null)
              return false;
          if(node1.val!=node2.val)
          return false;

          boolean compare1= checking(node1.left,node2.left);
          boolean compare2=checking(node1.right,node2.right);

          return compare1 && compare2;

  }
    public boolean isSubtree(TreeNode root, TreeNode subRoot) {
        Queue<TreeNode> queue =new LinkedList<>();
        queue.add(root);
        while(!queue.isEmpty()){
            TreeNode now= queue.poll();
            if(now.val ==subRoot.val){
                if(checking(now,subRoot))
                    return true;
            }
            if(now.left!=null)
                queue.add(now.left);
            if(now.right!=null)
                queue.add(now.right);
        }
        return false;
    }
}
