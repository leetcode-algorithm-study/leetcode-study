/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    vector<vector<int>> levelOrder(TreeNode* root) {
        if(!root)
        {
            return {};
        }
        vector<vector<int>> res;
        queue<TreeNode*> q;
        q.push(root);
        while(!q.empty())
        {
            res.push_back({});
            for(int i=0,n=q.size();i<n;i++)
            {
                TreeNode* curr=q.front();
                q.pop();
                res.back().push_back(curr->val);
                if(curr->left)
                    q.push(curr->left);
                if(curr->right)
                    q.push(curr->right);
            }
        }
        return res;
    }
};

/*
Runtime: 0 ms, faster than 100.00% of C++ online submissions for Binary Tree Level Order Traversal.
Memory Usage: 12.6 MB, less than 17.66% of C++ online submissions for Binary Tree Level Order Traversal.
*/
