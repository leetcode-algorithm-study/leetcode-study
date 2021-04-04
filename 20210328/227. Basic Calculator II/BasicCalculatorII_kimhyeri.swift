class Solution {
    func calculate(_ s: String) -> Int {
        let operations = Set("+-*/")
        var stack = [Int]()
        var lastNumber: Int = 0
        var lastOp: Character = "+"

        func calculator() {
            if lastOp == "+" {
                stack.append(lastNumber)
            } else if lastOp == "-" {
                stack.append(-lastNumber)
            } else if lastOp == "/" {
                let number = stack.removeLast()
                stack.append(number/lastNumber)
            } else {
                let number = stack.removeLast()
                stack.append(number * lastNumber)
            }
        }

        for char in s {
            if char.isNumber {
                lastNumber = ( lastNumber * 10 ) + Int(String(char))!
            } else if operations.contains(char) {
                calculator()
                lastOp = char
                lastNumber = 0
            }
        }

        calculator()
        return stack.reduce(0, +)
    }
}

print(calculate("3+2*2"))
print(calculate(" 3/2 "))
print(calculate(" 3+5 / 2 "))
