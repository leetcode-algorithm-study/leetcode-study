class Solution {
public:
	int findMaxSum(TreeNode* root, int& maxSum)
	{
		if (root == NULL)
		{
			return NULL;
		}
		int leftMax = findMaxSum(root->left, maxSum);
		int rightMax = findMaxSum(root->right, maxSum);
		int maxSingle = max(max(leftMax,rightMax)+root->val,root->val);
		int maxTop = max(maxSingle, leftMax + rightMax + root->val);
		maxSum = max(maxSum, maxTop);

		return maxSingle;
	}
	int maxPathSum(TreeNode* root) {
		int maxSum = INT_MIN;
		findMaxSum(root, maxSum);
		return maxSum;
	}
};

//Runtime: 32 ms, faster than 83.69% of C++ online submissions for Binary Tree Maximum Path Sum.
//Memory Usage: 28.9 MB, less than 77.79% of C++ online submissions for Binary Tree Maximum Path Sum.
