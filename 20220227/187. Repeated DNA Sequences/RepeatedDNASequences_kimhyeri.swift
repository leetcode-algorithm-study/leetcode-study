class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count > 10 else { return [] }
        
        var dict = [String : Int]()
        var answer = [String]()
        
        let s = Array(s)
        
        for i in 0..<s.count - 9{
            if let value = dict[String(s[i..<i+10])], value == 1 {
                answer.append(String(s[i..<i+10]))
                dict[String(s[i..<i+10])]! = value + 1
            } else if dict[String(s[i..<i+10])] == nil {
               dict[String(s[i..<i+10])] = 1
            }
        }
        return answer
    }
}
