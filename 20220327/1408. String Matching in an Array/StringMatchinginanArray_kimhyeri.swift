class Solution {
    func stringMatching(_ words: [String]) -> [String] {
        var answer = [String]()
            
        for i in 0..<words.count {
            for j in 0..<words.count {
                if i != j, words[i].contains(words[j]), !answer.contains(words[j]) {
                    answer.append(words[j])
                }
            }
        }
        
        return answer
    }
}
