class Solution:
    def coinChange(self, coins: List[int], amount: int) -> int:


#         result = 0
#         i = len(coins) - 1
#         coins.sort()

#         while amount > 0 and i >= 0:

#             if amount >= coins[i]:
#                 amount -= coins[i]
#                 result += 1
#             else:
#                 i-=1

#         if amount > 0:
#             print(amount)
#             return -1

        coins.sort()
        dp = [math.inf] * (amount + 1)
        dp[0] = 0

        for value in range(1, amount + 1):
            for coin in coins:
                if value >= coin:
                    dp[value] = min(dp[value], dp[value - coin] + 1)
                else:
                    break

        return dp[amount] if dp[amount] != math.inf else -1
        