//Runtime: 172 ms, faster than 50.04% of C++ online submissions for Perfect Squares.
//Memory Usage: 9.1 MB, less than 48.90% of C++ online submissions for Perfect Squares.

class Solution {
public:
	int numSquares(int n) {
        vector<int> dp(n+1, INT_MAX);
        dp[0]=0;
        for(int i=1; i<=n; i++)
        {
            for(int j=1;j*j<=i;j++)
            {
                dp[i]=min(dp[i],1+dp[i-j*j]);
            }
        }
        return dp[n];
    }
};