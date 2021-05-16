/*
Runtime: 13 ms, faster than 54.14% of Java online submissions for Coin Change.
Memory Usage: 38.5 MB, less than 52.51% of Java online submissions for Coin Change.
*/
class Solution {
    public int coinChange(int[] coins, int amount) {
        int dp[] = new int[amount+1];
        Arrays.fill(dp, 1, amount+1, Integer.MAX_VALUE);

        for(int i=1; i<=amount; i++){
            for(int j=0; j<coins.length; j++){
                if(coins[j] <= i && dp[i-coins[j]] != Integer.MAX_VALUE) {
                    dp[i] = Math.min(dp[i], dp[i-coins[j]] + 1);
                }
            }
        }

        return dp[amount] == Integer.MAX_VALUE ? -1 : dp[amount];
    }
}