/*
Runtime: 60 ms, faster than 37.34% of Java online submissions for Longest Increasing Subsequence.
Memory Usage: 38.7 MB, less than 44.77% of Java online submissions for Longest Increasing Subsequence.
*/
class Solution {
    public int lengthOfLIS(int[] nums) {
        int dp[] = new int[nums.length];
        int max = 1;

        for(int i=0; i<nums.length; i++){
            dp[i]=1;
            for(int j=0; j<i; j++){
                if(nums[j] < nums[i]) {
                    dp[i] = Math.max(dp[i], dp[j]+1);
                    max = Math.max(max, dp[i]);
                }
            }
        }

        return max;
    }
}