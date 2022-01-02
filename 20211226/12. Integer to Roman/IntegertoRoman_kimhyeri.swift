class Solution {
    func intToRoman(_ num: Int) -> String {
        var symbol = [1000: "M", 900: "CM", 500: "D", 400: "CD", 100: "C", 90: "XC", 50: "L", 40: "XL", 10: "X", 9: "IX", 5: "V", 4: "IV", 1: "I"]
        var array = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
        var num = num
        var answer = ""
    
        for i in array {
            if num > 0, i <= num {
                let val = num / i
                for j in 0..<val {
                    answer.append(symbol[i] ?? "")
                    num = num - i
                }
            }
        }
        return answer
    }
}
