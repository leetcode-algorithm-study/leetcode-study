class Solution {
    fun singleNumber(nums: IntArray): Int {
        var result: Int = 0
        for(i in 0 until nums.size) {
            result = result xor nums[i]
        }
        return result
    }
}