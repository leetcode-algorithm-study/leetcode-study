class Solution {
    func romanToInt(_ s: String) -> Int {
        var romanToIntDict: [Character: Int] = [
            "I": 1, 
            "V": 5,
            "X": 10,
            "L": 50, 
            "C": 100, 
            "D": 500, 
            "M": 1000]

        let characters = Array(s)
        var answer = 0
        var i = 0
        
        while i < characters.count {
            let current = romanToIntDict[characters[i]] ?? 0
            
            // 다음 문자가 있고, 다음 값이 현재보다 크면 빼고
            if i + 1 < characters.count,
               let next = romanToIntDict[characters[i + 1]], current < next {
                answer += next - current
                i += 2  // 두 문자 건너뜀
            } 
            // 아니면 더하고
            else {
                answer += current
                i += 1
            }
        }
        
        return answer
    }
}

// time complexity O(n)