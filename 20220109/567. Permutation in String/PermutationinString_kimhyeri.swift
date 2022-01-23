class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let offset = "a".unicodeScalars.first!.value
        var first = [Int](repeating: 0, count: 26)
        var second = [Int](repeating: 0, count: 26)
        var start = 0
        
        for c in s1 {
            let val = c.unicodeScalars.first!.value
            first[Int(val-offset)] += 1
        }
        
        let s2Arr = Array(s2)
        
        for end in 0..<s2Arr.count {
            var val = s2Arr[end].unicodeScalars.first!.value
            second[Int(val-offset)] += 1
            
            // s1에 포함될려면 사이즈가 같아야 함
            while end-start+1 == s1.count {
                // 동일하게 존재한다면
                if first == second {
                    return true
                }
                val = s2Arr[start].unicodeScalars.first!.value
                // 앞에 있는걸 지운다
                second[Int(val-offset)] -= 1
                start += 1
            }
        }
        // 마지막까지 갔는데 없으면 false
        return false
    }

}
