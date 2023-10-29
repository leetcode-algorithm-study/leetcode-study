class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let str = s.filter { $0.isNumber || $0.isLetter }.lowercased()
        return str == String(str.reversed())
    }
}