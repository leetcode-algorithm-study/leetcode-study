class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var buy = 0
        var profit = 0

        for i in 1..<prices.count {
            profit = max(prices[i] - prices[buy], profit)
            if prices[i] - prices[buy] < 0 {
                buy = i
            }
        }

        return profit
    }
}
