class Solution {
    func longestPalindrome(_ s: String) -> String {
        let array = Array(s)
        var start = 0
        var end = 0

        func getSubSlide(_ left: Int, _ right: Int) -> Int {
            var l = left, r = right
            
            while l >= 0 && r < array.count && array[l] == array[r] {
                l -= 1
                r += 1
            }
            
            return r - l - 1
        }
        
        for i in 0..<s.count {
            let maximum = max(getSubSlide(i, i), getSubSlide(i, i+1))
            if maximum > end - start + 1 {
                start = i - (maximum - 1) / 2
                end = i + maximum / 2
            }
        }

        let startIndex = s.index(s.startIndex, offsetBy: start)
        let endIndex = s.index(s.startIndex, offsetBy: end)
        let range = startIndex...endIndex
        return String(s[range])
    }
}
