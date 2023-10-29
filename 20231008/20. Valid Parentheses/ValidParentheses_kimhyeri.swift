class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        
        func popLastElement() -> Character? {
            if stack.isEmpty { return nil }
            return stack.removeLast()
        }
        
        for i in s {
            switch i {
            case ")":
                guard let char = popLastElement(), char == "(" else { return false }
            case "]":
                guard let char = popLastElement(), char == "[" else { return false }
            case "}":
                guard let char = popLastElement(), char == "{" else { return false }
            default:
                stack.append(i)
            }
        }
        
        if stack.isEmpty {
            return true
        } else {
            return false
        }
    }
}