class Solution {
    func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
        var answer = ""
        var list = [String]()
        
        let split = sentence.split(separator: " ").map{ String($0) }
        
        for i in split {
            var has = false
            
            for j in dictionary {
                if i.hasPrefix(j) {
                    list.append(j)
                    has = true
                }
            }
            
            if has {
                if list.count > 1 {
                    let shortest = list.sorted { a, b in
                        a.count < b.count
                    }.first!
                    
                    answer.append(contentsOf: "\(shortest) ")
                } else {
                    answer.append(contentsOf: "\(list.first!) ")
                }
            } else {
                answer.append(contentsOf: "\(i) ")
            }
            
            list.removeAll()
        }
        
        answer.removeLast()
        return answer
    }
}
