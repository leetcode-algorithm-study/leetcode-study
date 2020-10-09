/**
 * 98. Validate Binary Search Tree ( Medium )
 * Given a binary tree, determine if it is a valid binary search tree (BST).
 * 
 * Assume a BST is defined as follows:
 * 
 * The left subtree of a node contains only nodes with keys less than the node's key.
 * The right subtree of a node contains only nodes with keys greater than the node's key.
 * Both the left and right subtrees must also be binary search trees.
 * ss
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
    bool isValidBST(TreeNode* root) {
        auto info = getNodeInfo(root);
        return info.valid;
    }
    
private:
    struct NodeInfo {
        int min = INT_MAX;
        int max = INT_MIN;
        bool valid = true;
    };

    NodeInfo getNodeInfo( TreeNode* root ) {
        if( root == nullptr ) return NodeInfo();
        auto left = getNodeInfo( root->left );
        auto right = getNodeInfo( root->right );
        if( left.valid && right.valid ) {
            bool valid = ((root->left != nullptr) ? (left.max < root->val) : true) &&  //Add null check for case [2147483647](INT_MAX)
                ((root->right != nullptr) ? (right.min > root->val) : true);
            return { min( root->val, min(left.min, right.min) ), 
                    max(root->val, max(left.max, right.max) ), 
                    valid }; 
        }
        else return { 0, 0, false };
    }  
};
// Runtime: 8 ms, faster than 99.46% of C++ online submissions for Validate Binary Search Tree.
// Memory Usage: 22.3 MB, less than 90.55% of C++ online submissions for Validate Binary Search Tree.


class Solution {
public:
    bool isValidBST(TreeNode* root) {
        return isValidBST(root, NULL, NULL);
    }

    bool isValidBST(TreeNode* root, TreeNode* minNode, TreeNode* maxNode) {
        if(!root) return true;
        if(minNode && root->val <= minNode->val || maxNode && root->val >= maxNode->val)
            return false;
        return isValidBST(root->left, minNode, root) && isValidBST(root->right, root, maxNode);
    }
};

// Runtime: 12 ms, faster than 95.50% of C++ online submissions for Validate Binary Search Tree.
// Memory Usage: 22.1 MB, less than 90.55% of C++ online submissions for Validate Binary Search Tree.