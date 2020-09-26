func isMatch(_ s: String, _ p: String) -> Bool {
    let s = Array(s)
    let p = Array(p)

    func matching(indexS: Int = 0, indexP: Int = 0) -> Bool {
        var indexS = indexS
        
        for indexP in indexP..<p.count {
            // *에 대한 작업이 끝났으니 continue (s인덱스는 마무리가 된 상황)
            if p[indexP] == Character("*") {
                continue
            } else {
                var indexPStar = false
                let indexPNext = indexP + 1
                
                // p 다음것이 *인지 아닌지
                if indexPNext < p.count {
                    if p[indexPNext] == Character("*") {
                        indexPStar = true
                    }
                }

                // 다음것이 *이면
                if indexPStar {
                    if indexS < s.count {
                        // 문자가 동일한 경우나, .일때
                        while s[indexS] == p[indexP] || p[indexP] == Character(".") {
                            // indexS에 하나 증가해서 재귀
                            if matching(indexS: indexS + 1, indexP: indexP) {
                                return true
                            }
                            break
                        }
                    }
                } else { // 다음것이 *이 아니라면
                    if indexS >= s.count {
                        return false
                    }
                    if s[indexS] != p[indexP], p[indexP] != Character(".") {
                        return false
                    }
                    indexS += 1
                }
            }
        }
        return indexS >= s.count
    }

    return matching()
}
print(isMatch("mississippi", "mis*is*p*."))
// false

print(isMatch("a", "ab*a"))
// false

print(isMatch("a", "ab*"))
// true

print(isMatch("aaca", "ab*a*c*a"))
// true

print(isMatch("aaa", "ab*a*c*a"))
// true

print(isMatch("aaa", "ab*ac*a"))
// true

print(isMatch("aaa", "a.a"))
// true

print(isMatch("aab", "c*a*b"))
// true

print(isMatch("aaa", "aaaa"))
// false

print(isMatch("mississippi", "mis*is*ip*."))
// true

print(isMatch("aa", "a"))
// false

print(isMatch("aa", "a*"))
// true

print(isMatch("ab", ".*"))
// true
