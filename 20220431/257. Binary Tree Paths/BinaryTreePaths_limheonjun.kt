/**
 * Example:
 * var ti = TreeNode(5)
 * var v = ti.`val`
 * Definition for a binary tree node.
 * class TreeNode(var `val`: Int) {
 *     var left: TreeNode? = null
 *     var right: TreeNode? = null
 * }
 */
class Solution {
    fun binaryTreePaths(root: TreeNode?): List<String> {
        val result = mutableListOf<String>()
        val tempList = mutableListOf<Int>()

        dfs(root, tempList, result)

        return result
    }

    fun dfs(root: TreeNode?, tempList: MutableList<Int>, result: MutableList<String>) {
        if(isLeafNode(root)) {
            tempList.add(root!!.`val`)
            result.add(tempList.toMutableList().joinToString("->"))
            tempList.removeAt(tempList.size-1)
        } else {
            tempList.add(root!!.`val`)
            root.left?.let {
                dfs(root.left, tempList, result)
            }
            root.right?.let {
                dfs(root.right, tempList, result)
            }
            tempList.removeAt(tempList.size-1)
        }
    }

    private fun isLeafNode(root: TreeNode?): Boolean {
        if(root!!.left == null && root!!.right == null) {
            return true
        }
        return false
    }
}