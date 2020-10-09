/**
 * 94. Binary Tree Inorder Traversal( Medium )
 * Given the root of a binary tree, return the inorder traversal of sits nodes' values.
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
    vector<int> inorderTraversal(TreeNode* root) {
        if( root == nullptr ) return vector<int>(0);
        auto nodeValues = inorderTraversal( root->left );
        nodeValues.push_back( root->val );
        auto rightValues = inorderTraversal( root->right );
        nodeValues.insert(nodeValues.end(), rightValues.begin(), rightValues.end());
        return nodeValues;
    }
};
// Runtime: 0 ms, faster than 100.00% of C++ online submissions for Binary Tree Inorder Traversal.
// Memory Usage: 9.9 MB, less than 8.92% of C++ online submissions for Binary Tree Inorder Traversal.