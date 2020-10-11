class Solution {
public:
	vector<int> inorderTraversalRecursive(TreeNode* root) {
		vector<int> res;
		if (root != nullptr)
		{
			if (root->left != nullptr)
			{
				vector<int> resLeft = inorderTraversal(root->left);
				for (auto i : resLeft)
				{
					res.push_back(i);
				}
			}

			res.push_back(root->val);

			if (root->right != nullptr)
			{
				vector<int> resRight = inorderTraversal(root->right);
				for (auto i : resRight)
				{
					res.push_back(i);
				}
			}
		}
		return res;
	}
	vector<int> inorderTraversalIterative(TreeNode* root) {
		vector<int> res;
		TreeNode* tmp = root;
		stack<TreeNode*> st;
		while (tmp != nullptr || !st.empty())
		{
			while (tmp != nullptr)
			{
				st.push(tmp);
				tmp = tmp->left;
			}
			tmp = st.top();
			st.pop();
			res.push_back(tmp->val);
			tmp = tmp->right;
		}
		return res;
	}
};

/*
Recursive
Runtime: 0 ms
Memory Usage: 10.3 MB

Iterative
Runtime: 4 ms
Memory Usage: 8.8 MB
*/
