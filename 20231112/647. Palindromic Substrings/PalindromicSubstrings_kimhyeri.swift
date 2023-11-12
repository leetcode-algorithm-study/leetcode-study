class Solution {
    func countSubstrings(_ s: String) -> Int {
        let array = Array(s)
        var answer = 0

        func palindromeCount(_ left: Int, _ right: Int) {
            var l = left, r = right
            while l >= 0 && r < array.count && array[l] == array[r] {
                answer += 1
                l -= 1
                r += 1
            }
        }

        for i in 0..<array.count {
            palindromeCount(i, i)
            palindromeCount(i, i+1)
        }
        return answer
    }
}