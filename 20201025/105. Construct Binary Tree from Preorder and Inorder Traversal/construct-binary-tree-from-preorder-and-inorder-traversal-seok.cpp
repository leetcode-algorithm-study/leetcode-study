class Solution {
public:
	TreeNode* build(vector<int>& preorder, int pStart, int pEnd, vector<int>& inorder, int iStart, int iEnd) {

		if (pStart > pEnd)
		{
			return NULL;
		}
		if (iStart > iEnd)
		{
			return NULL;
		}

		TreeNode* root;
		root = new TreeNode(preorder[pStart]);
		for (int i = iStart; i <= iEnd; i++)
		{
			if (preorder[pStart] == inorder[i])
			{
				root->left = build(preorder, pStart + 1, i+pEnd, inorder, iStart, i - 1);
				root->right = build(preorder, pStart + i+1-iStart, pEnd, inorder, i + 1, iEnd);
				break;
			}
		}
		return root;
	}
	TreeNode* buildTree(vector<int>& preorder, vector<int>& inorder) {
		TreeNode* root;
		int pEnd = preorder.size() - 1;
		int iEnd = inorder.size() - 1;
		return root = build(preorder, 0, pEnd, inorder, 0, iEnd);
	}
};

/*
Runtime: 36 ms, faster than 50.76% of C++ online submissions for Construct Binary Tree from Preorder and Inorder Traversal.
Memory Usage: 26.7 MB, less than 5.74% of C++ online submissions for Construct Binary Tree from Preorder and Inorder Traversal.
*/
