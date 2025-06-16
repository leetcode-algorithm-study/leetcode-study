class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()

        for char in s {
            if char == "(" || char == "{" || char == "[" {
                stack.append(char)
            } else {
                if stack.isEmpty { return false }
                if char == ")" {
                    let open = stack.removeLast()
                    if open != "(" { return false }
                } else if char == "}" {
                    let open = stack.removeLast()
                    if open != "{" { return false }
                } else if char == "]" {
                    let open = stack.removeLast()
                    if open != "[" { return false }
                }
            } 
        }

        return stack.isEmpty
    }
}