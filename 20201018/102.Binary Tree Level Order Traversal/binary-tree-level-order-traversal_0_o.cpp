/**
 * Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
 * 
 * For example:
 * Given binary tree [3,9,20,null,null,15,7],
 *     3
 *    / \
 *   9  20
 *     /  \
 *    15   7
 * 
 * return its level order traversal as:
 * [
 *   [3],
 *   [9,20],
 *   [15,7]
 * ]
 */ 

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
        if( !root ) return {};
        vector<TreeNode*> current{ root };
        vector<TreeNode*> next {};
        vector<vector<int>> retVal{};
        while( current.size() > 0 ) {
            retVal.push_back({});
            for( const auto* entity : current ) {
                retVal.back().push_back( entity->val );
                if( entity->left ) next.push_back(entity->left);
                if( entity->right ) next.push_back(entity->right);
            };
            current = std::move(next);
        }
        return retVal;
    }
};