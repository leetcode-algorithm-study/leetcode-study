class Solution {
    fun climbStairs(n: Int): Int {
        val dp = Array<Int>(46) { 0 }
        dp[1] = 1
        dp[2] = 2

        if(n <= 2) return dp[n]

        for(i in 3..n) {
            dp[i] = dp[i-1] + dp[i-2]
        }

        return dp[n]
    }
}