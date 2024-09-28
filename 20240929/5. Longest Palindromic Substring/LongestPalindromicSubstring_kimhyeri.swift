class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 0 else { return "" }
        var start = 0
        var end = 0

        func expandAroundCenter(_ s: String, left: Int, right: Int) -> Int {
            let array = Array(s)
            var l = left
            var r = right

            while l >= 0 && r < array.count && array[l] == array[r] {
                l -= 1
                r += 1
            }

            return r - l - 1 // 팰린드롬의 길이 반환
        }

        for i in 0..<s.count {
            let len1 = expandAroundCenter(s, left: i, right: i)     // 홀수 길이
            let len2 = expandAroundCenter(s, left: i, right: i + 1) // 짝수 길이
            let maxLen = max(len1, len2)

            if maxLen > end - start { // 현재 발견된 팰린드롬이 이전에 발견된 것보다 더 길다면
                start = i - (maxLen - 1) / 2
                end = i + maxLen / 2
            }
        }
        
        let startIndex = s.index(s.startIndex, offsetBy: start)
        let endIndex = s.index(s.startIndex, offsetBy: end)
        let substring = String(s[startIndex...endIndex])
        return substring
    }
}