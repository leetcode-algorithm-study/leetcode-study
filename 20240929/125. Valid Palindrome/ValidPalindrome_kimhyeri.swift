class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let letters = s.filter { $0.isLetter || $0.isNumber }.lowercased()
        return String(letters) == String(letters.reversed())
    }
}