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
    vector<vector<int>> zigzagLevelOrder(TreeNode* root) {       
        if(!root)
        {
            return {};
        }
        vector<vector<int>> res;
        queue<TreeNode*> q;
        bool pushRight=true;
        q.push(root);
        while(!q.empty())
        {
            res.push_back({});
            for(int i=0,n=q.size();i<n;i++)
            {
                TreeNode* curr=q.front();
                q.pop();
                if(pushRight)
                {
                    res.back().push_back(curr->val);
                }
                else
                {
                    res.back().insert(res.back().begin(),curr->val);
                }
                if(curr->left)
                    q.push(curr->left);
                if(curr->right)
                    q.push(curr->right);
            }
            pushRight=!pushRight;
        }
        return res;
    }
};  

/*
Runtime: 4 ms, faster than 78.23% of C++ online submissions for Binary Tree Zigzag Level Order Traversal.
Memory Usage: 12.5 MB, less than 32.03% of C++ online submissions for Binary Tree Zigzag Level Order Traversal.
*/
