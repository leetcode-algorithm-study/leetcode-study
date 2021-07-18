//Runtime: 24 ms, faster than 87.63% of C++ online submissions for Binary Search Tree Iterator.
//Memory Usage: 24.1 MB, less than 55.16% of C++ online submissions for Binary Search Tree Iterator.

class BSTIterator {
private:
	vector<int> v;
	int idx = 0;
	void initializeTree(TreeNode* root)
	{
		if (!root)
		{
			return;
		}
		if (root->left)
		{
			initializeTree(root->left);
		}
		v.push_back(root->val);
		if (root->right)
		{
			initializeTree(root->right);
		}
	}
public:
	BSTIterator(TreeNode* root) {
		initializeTree(root);
		return;
	}

	int next() {
		return v[idx++];
	}

	bool hasNext() {
		int n = v.size();
		return (n - idx);
	}
};
