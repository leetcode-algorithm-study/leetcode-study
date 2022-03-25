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

//TLE
//func maxProfit(_ prices: [Int]) -> Int {
//    var answer = 0
//
//    for i in 0..<prices.count {
//        var buy = prices[i]
//
//        for j in i..<prices.count {
//            var sell = prices[j]
//            if buy < sell {
//                answer = max(answer, sell - buy)
//            }
//        }
//    }
//
//    return answer
//}
