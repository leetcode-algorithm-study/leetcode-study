func longestPalindrome(_ s: String) -> Int {
    var answer = 0
    var dict = [Character: Int]()

    if s.count == 1 { return 1 }
    
    for i in s {
        if let value = dict[i] {
            dict[i] = value + 1
        } else {
            dict[i] = 1
        }
    }

    for i in dict.values {
        if i > 1 {
            if i % 2 == 0 {
                answer = answer + i
            } else {
                answer = answer + i - 1
            }
        }
    }
    
    if answer == s.count {
        return answer
    } else {
        return answer + 1
    }
}
