class Solution {
    func countBits(_ n: Int) -> [Int] {
        var answer = [Int]()
 
        for i in 0...n {
            var str = String(i, radix: 2)
            answer.append(str.filter { $0 == "1" }.count)
        }
        
        return answer
    }
}
