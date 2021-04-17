
//Runtime: 16 ms, faster than 67.44% of C++ online submissions for Lowest Common Ancestor of a Binary Tree.
//Memory Usage: 17.7 MB, less than 7.33% of C++ online submissions for Lowest Common Ancestor of a Binary Tree.
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
private:
    bool func(TreeNode* node, int val, vector<TreeNode*>& ancestor)
    {
        if(!node)   return false;
        if(node->val == val)
        {
            cout<<node->val<<' ';
            ancestor.push_back(node);
            return true;
        }
        
        if(func(node->left,val,ancestor)||func(node->right,val,ancestor))
        {
            cout<<node->val<<' ';
            ancestor.push_back(node);
            return true;
        }
        else
        {
            return false;
        }
    }
public:
    TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
        vector<TreeNode*> ancestor_p;
        vector<TreeNode*> ancestor_q;
        cout<<"p = ";
        func(root, p->val, ancestor_p);
        cout<<"\nq = ";
        func(root, q->val, ancestor_q);
        
        int idx=0;
        while(idx<ancestor_p.size())
        {
            for(int i=0;i<ancestor_q.size();i++)
            {
                if(ancestor_p[idx]->val==ancestor_q[i]->val)  return ancestor_p[idx];  
            }
            idx++;
        }
        return nullptr;
    }
};
