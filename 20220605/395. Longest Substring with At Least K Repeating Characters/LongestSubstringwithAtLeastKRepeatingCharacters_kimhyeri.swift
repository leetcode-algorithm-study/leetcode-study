// TLE
class Solution {
    func longestSubstring(_ s: String, _ k: Int) -> Int {
        var answer = 0
        var compare = [String: Int]()

        if s.count < k {
            return 0
        } else if Set(s).count == 1 {
            return s.count
        } else {
            var valid = false

            for i in 0...s.count-k {
                for j in 0...s.count-k-i {
                    let start = s.index(s.startIndex, offsetBy: i)
                    let end = s.index(s.startIndex, offsetBy: i+k+j)
                    let range = start..<end
                    let sub = s[range]
                    if compare[String(sub)] != nil {
                        break
                    } else {
                        var dict = [Character: Int]()

                        for z in sub {
                            if let count = dict[z] {
                                dict[z] = count + 1
                            } else {
                                dict[z] = 1
                            }
                        }

                        for z in dict {
                            if z.value >= k {
                                valid = true
                            } else {
                                valid = false
                                break
                            }
                        }

                        if valid {
                            answer = max(answer, sub.count)
                            compare[String(sub)] = 1
                        }
                    }
                }
            }
            return answer
        }
    }
}
