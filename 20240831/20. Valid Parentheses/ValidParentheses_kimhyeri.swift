class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [String]()

        for i in s {
            if i == ")", !stack.isEmpty {
                let matching = stack.removeLast()
                if matching != "(" {
                    return false
                }
            } else if i == "}", !stack.isEmpty {
                let matching = stack.removeLast()
                if matching != "{" {
                    return false
                }
            } else if i == "]", !stack.isEmpty {
                let matching = stack.removeLast()
                if matching != "[" {
                    return false
                }
            } else {
                stack.append(String(i))
            }
        }

        return stack.isEmpty
    }
}