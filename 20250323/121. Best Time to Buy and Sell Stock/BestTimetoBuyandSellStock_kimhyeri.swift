class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var maxProfit = 0

        for price in prices {
            minPrice = min(minPrice, price)  // 최저가 갱신
            maxProfit = max(maxProfit, price - minPrice)  // 최대 이익 갱신
        }

        return maxProfit
    }
}


// Complexity (On)
// space O(1)