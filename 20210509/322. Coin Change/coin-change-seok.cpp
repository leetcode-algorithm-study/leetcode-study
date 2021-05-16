
// Solution #1: Failed
class Solution {
private:
    bool getCoin(vector<int>& coins, int amount, int idx, int count, int& minCount)
    {
        if (amount - coins[idx] == 0)
        {
            minCount = min(count, minCount);
            return true;
        }
        else if (amount - coins[idx] > 0)
        {
            for (int i = idx; i >= 0; i--)
            {
                if (getCoin(coins, amount - coins[idx], i, count + 1, minCount))
                {
                    return true;
                }
            }
            return false;
        }
        else
        {
            return false;
        }
    }
public:
    int coinChange(vector<int>& coins, int amount) {
        sort(coins.begin(), coins.end());
        auto it = upper_bound(coins.begin(), coins.end(), amount);
        coins.erase(it, coins.end());

        int minCount = INT_MAX;

        for (int i = coins.size() - 1; i >= 0; i--)
        {
            if (getCoin(coins, amount, i, 1, minCount))
            {
                return minCount;
            }
        }

        return (amount == 0) ? 0 : -1;
    }

};

// Solution #2 DP
//Runtime: 60 ms, faster than 78.04% of C++ online submissions for Coin Change.
//Memory Usage : 14.4 MB, less than 55.57 % of C++ online submissions for Coin Change.

class Solution {
public:
	int coinChange(vector<int>& coins, int amount) {
		vector<int> dp(amount + 1, amount+1);
		dp[0] = 0;
		for (int i = 1; i <= amount; i++)
		{
			for (int coin : coins)
			{
				if (coin <= i)
				{
					dp[i] = min(dp[i], dp[i -coin] + 1);
					//cout << dp[i]<<'\n';
				}
			}
		}

		return (dp[amount]>amount)? -1:dp[amount];
	}
};