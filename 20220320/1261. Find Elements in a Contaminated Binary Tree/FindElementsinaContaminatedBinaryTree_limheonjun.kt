class FindElements(root: TreeNode?) {

    val set = mutableSetOf<Int>()

    init {
        setNumber(root)
    }

    fun find(target: Int): Boolean {
        return set.contains(target)
    }

    private fun setNumber(node: TreeNode?, num: Int = 0) {
        if(node == null) return

        setNumber(node.left, num*2+1)
        set.add(num)
        setNumber(node.right, num*2+2)

    }

}