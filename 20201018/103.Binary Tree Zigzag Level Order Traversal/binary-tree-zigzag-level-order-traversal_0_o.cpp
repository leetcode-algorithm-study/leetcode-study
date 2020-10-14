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
        if( !root ) return {};
        vector<TreeNode*> current{ root };
        vector<TreeNode*> next {};
        vector<vector<int>> retVal{};
        
        bool reverse = false;
        while( current.size() > 0 ) {
            retVal.push_back({});
            for( const auto* entity : current ) {
                if( !reverse ) {
                    retVal.back().push_back( entity->val );
                }else {
                    retVal.back().insert(retVal.back().begin(), entity->val);
                }
                
                if( entity->left ) next.push_back(entity->left);
                if( entity->right ) next.push_back(entity->right);
            };
            current = std::move(next);
            reverse = !reverse;
        }
        return retVal;
    }
};