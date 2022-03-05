class Solution {
    func diffWaysToCompute(_ input: String) -> [Int] {
        let char = Array(input)
        var ans = [Int]()
        
        for i in 0..<char.count {
            if char[i] == "-" || char[i] == "*" || char[i] == "+" {
                let left = String(char[0...(i - 1)])
                let right = String(char[(i + 1)...(char.count - 1)])
                let leftleft = diffWaysToCompute(left)
                let rightright = diffWaysToCompute(right)
                for l in leftleft {
                    for r in rightright {
                        var sum = 0
                        if char[i] == "+" {
                            sum = l + r
                        } else if char[i] == "-" {
                            sum = l - r
                        } else if char[i] == "*" {
                            sum = l * r
                        }
                        ans.append(sum)
                    }
                }
            }
        }
        
        if ans.count == 0 {
            return [Int(input)!]
        } else {
            return ans
        }
    }
}
