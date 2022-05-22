class Solution {
    fun sortedArrayToBST(nums: IntArray): TreeNode? {
        return dfs(nums, 0, nums.size-1)
    }
    
    fun dfs(nums: IntArray, start: Int, end: Int): TreeNode? {
        if (start > end) return null

        val mid = (start + end) / 2
        val root = TreeNode(nums[mid])
        root.left = dfs(nums, start, mid - 1)
        root.right = dfs(nums, mid + 1, end)
        return root
    }
}