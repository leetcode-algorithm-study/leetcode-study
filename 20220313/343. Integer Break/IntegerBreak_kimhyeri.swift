class Solution {
    func integerBreak(_ n: Int) -> Int {
        var dp = [1:1]

        func dfs(_ num: Int) -> Int {
            if dp[num] != nil { return dp[num]! }

            // 더 세부로 쪼개지지 않게 할려고
            if num != n {
                dp[num] = num
            } else {
                dp[num] = 0
            }

            // i가 left value가 된다.
            for i in 1..<num {
                let val = dfs(i) * dfs(num - i)
                dp[num] = max(dp[num]!, val)
            }

            return dp[num]!
        }

        return dfs(n)
    }
}

// resource: https://www.youtube.com/watch?v=in6QbUPMJ3I
