class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count > 10 else { return [] }
        
        var dict = [String : Int]()
        var answer: Set<String> = Set<String>()
        
        let s = Array(s)
        
        for i in 0..<s.count - 9{
            if let value = dict[String(s[i..<i+10])] {
                answer.insert(String(s[i..<i+10]))
            } else {
               dict[String(s[i..<i+10])] = 1
            }
        }
        return Array(answer)
    }
}
