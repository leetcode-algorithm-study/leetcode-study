class Solution {
private:
	bool validRecursive(TreeNode* root, long min, long max)
	{
		bool chk = true;
		if (root != nullptr)
		{
			chk &= (root->val > min);
			chk &= validRecursive(root->left, min, root->val);
			chk &= (root->val < max);
			chk &= validRecursive(root->right, root->val, max);
		}
		return chk;
	}
	bool validIterative(TreeNode* root) {
		long threshold = LONG_MIN;
		stack<TreeNode*> st;
		while (root || !st.empty()) {
			while (root) {
				st.push(root);
				root = root->left;
			}
			root = st.top();
			st.pop();
			if (root->val <= threshold) {
				return false;
			}
			threshold = root->val;
			root = root->right;
		}
		return true;
	}
public:
	bool isValidBST(TreeNode* root) {
		return validRecursive(root, LONG_MIN, LONG_MAX);
		//return validIterative(root);
	}
};

/*
Recursive & Iterative (Same result)
Runtime: 16 ms
Memory Usage: 22 MB
*/
