//Runtime: 28 ms, faster than 7.72 % of C++ online submissions for Kth Smallest Element in a BST.
//Memory Usage : 24.5 MB, less than 14.51 % of C++ online submissions for Kth Smallest Element in a BST.
class Solution {
private:
	void dfs(TreeNode* node, priority_queue<int, vector<int>, greater<int>>& pq)
	{
		if (!node)	return;
		pq.push(node->val);
		dfs(node->left, pq);
		dfs(node->right, pq);
	}
public:
	int kthSmallest(TreeNode* root, int k) {
		priority_queue<int, vector<int>, greater<int>> pq;
		dfs(root, pq);
		int ans = 0;
		while (k--)
		{
			ans = pq.top();
			pq.pop();
		}
		return ans;
	}
};