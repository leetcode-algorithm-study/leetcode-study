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
            // 홀수 aba의 경우 a를 중심으로 확장해나감
            palindromeCount(i, i)
            // 짝수 abba의 경우 두 b,b를 중심으로 확장해나감
            palindromeCount(i, i+1)
        }
        return answer
    }
}