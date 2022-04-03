class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        if not prices:
            return 0

        buy_price, max_profit = prices[0], 0

        for i in range(1, len(prices)): # 1,2,3,4,5
            max_profit = max(max_profit, prices[i] - buy_price)
            buy_price = min(buy_price, prices[i])

        return max_profit