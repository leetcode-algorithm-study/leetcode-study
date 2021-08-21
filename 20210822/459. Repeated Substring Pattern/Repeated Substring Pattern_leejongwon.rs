impl Solution {
    pub fn repeated_substring_pattern(s: String) -> bool {
        for tokenLen in 1..(s.len() / 2 + 1) {
            if s.len() % tokenLen != 0 {
                continue;
            }
            if s.eq(&s[..tokenLen].repeat(s.len() / tokenLen)) {
                return true;
            }
        }
        false
    }
}