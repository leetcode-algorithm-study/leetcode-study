class Solution {
    var memo: [String: Bool] = [:]
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        if let result = memo[s] {
            return result
        } else if s.isEmpty {
            return true
        } else {
            for i in 0..<wordDict.count {
                if s.hasPrefix(wordDict[i]) {
                    let next = String(s.dropFirst(wordDict[i].count))
                    if wordBreak(next, wordDict) {
                        memo[next] = true
                        return true
                    }
                }
            }

            memo[s] = false
            return false
        }
    }
}
